import nimcrypto
import hkdf
import endians, sequtils

const 
    PerspectiveServer = 1
    PerspectiveClient = 2
    gcmStandardNonceSize* = 12
    gcmBlockSize* = 16

type AeadAESGCM*[T] = object
    otherIV:   seq[uint8]
    myIV:      seq[uint8]
    encrypter: GCM[T]
    decrypter: GCM[T]

proc computeSecrets*(HashType: typedesc ,connID: string): tuple[clientSecret, serverSecret: seq[uint8]] =
    var initialSecret = hkdfExtract(HashType, cast[string](quicVersion1Salt), connID)
    result.clientSecret = hkdfExpandLabel(HashType, initialSecret.data, "client in", sha256.sizeDigest)
    result.serverSecret = hkdfExpandLabel(HashType, initialSecret.data, "server in", sha256.sizeDigest)

proc computeAEADKeyAndIV*(HashType: typedesc,secret: string): tuple[key,iv: string] = 
    result.key = hkdfExpandLabel(HashType,secret, "key", 16)
    result.iv = hkdfExpandLabel(HashType,secret, "iv", 12)

proc newAEAD*[T](HashType: typedesc ,connectionId: string, pers: int): AeadAESGCM[T] =  
    var (clientSecret, serverSecret) = computeSecrets(HashType, connectionId)
    var mySecret, otherSecret: string
    if pers == PerspectiveClient:
        mySecret = clientSecret
        otherSecret = serverSecret
    else:
        mySecret = serverSecret
        otherSecret = clientSecret
    var (myKey, myIV) = computeAEADKeyAndIV(HashType, mySecret)
    var (otherKey, otherIV) = computeAEADKeyAndIV(HashType, otherSecret)
    var ectx, dctx: GCM[aes128]
    var aad = "Alice Authentication Data"
    ectx.init(myKey, myIV, aad)
    dctx.init(otherKey, otherIV, aad)
    result = AeadAESGCM[T](otherIV, myIV, ectx, dctx)

proc makeNonce*(iv: seq[uint8], packetNumber: uint64): seq[uint8] =
    result.setLen iv.len
    bigEndian64(unsafeAddr result[4], unsafeAddr packetNumber)
    for i in 0..<iv.len:
        result[i] = result[i] xor iv[i]

proc seal*[T](aead: AeadAESGCM[T], plaintext: string, aad: string): seq[uint8] =
    if plaintext.len > (1 shl 32 - 2)*16:
        echo "crypto/cipher: message too large for GCM"
    result = newSeq[uint8](len(aad))
    aead.ectx.encrypt(plaintext, result)
    aead.ectx.clear()


proc open*[T](aead: AeadAESGCM[T], encText: string, aad: string): seq[uint8] =
    var dtag: array[aes128.sizeBlock, uint8] 
    result= newSeq[uint8](len(aad))
    aead.dctx.dencrypt(encText, result)
    aead.dctx.getTag(dtag)
    aead.dctx.clear()

when isMainModule:
    import strutils, strformat
    var connId = @[0x83'u8, 0x94, 0xc8, 0xf0, 0x3e, 0x51, 0x57, 0x08]
    var connStr = cast[string](connId)
    var (clientSecret, serverSecret) = computeSecrets(sha256, connStr)
    echo clientSecret
    echo serverSecret
