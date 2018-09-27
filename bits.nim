import sequtils

const ntz8tab: array[256, uint8] =
    [0x08, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x05, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x06, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x05, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x07, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x05, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x06, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x05, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00,
    0x04, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00, 0x03, 0x00, 0x01, 0x00, 0x02, 0x00, 0x01, 0x00].mapLiterals(uint8)

const pop8tab: array[256, uint8] =
    [0x00, 0x01, 0x01, 0x02, 0x01, 0x02, 0x02, 0x03, 0x01, 0x02, 0x02, 0x03, 0x02, 0x03, 0x03, 0x04,
    0x01, 0x02, 0x02, 0x03, 0x02, 0x03, 0x03, 0x04, 0x02, 0x03, 0x03, 0x04, 0x03, 0x04, 0x04, 0x05,
    0x01, 0x02, 0x02, 0x03, 0x02, 0x03, 0x03, 0x04, 0x02, 0x03, 0x03, 0x04, 0x03, 0x04, 0x04, 0x05,
    0x02, 0x03, 0x03, 0x04, 0x03, 0x04, 0x04, 0x05, 0x03, 0x04, 0x04, 0x05, 0x04, 0x05, 0x05, 0x06,
    0x01, 0x02, 0x02, 0x03, 0x02, 0x03, 0x03, 0x04, 0x02, 0x03, 0x03, 0x04, 0x03, 0x04, 0x04, 0x05,
    0x02, 0x03, 0x03, 0x04, 0x03, 0x04, 0x04, 0x05, 0x03, 0x04, 0x04, 0x05, 0x04, 0x05, 0x05, 0x06,
    0x02, 0x03, 0x03, 0x04, 0x03, 0x04, 0x04, 0x05, 0x03, 0x04, 0x04, 0x05, 0x04, 0x05, 0x05, 0x06,
    0x03, 0x04, 0x04, 0x05, 0x04, 0x05, 0x05, 0x06, 0x04, 0x05, 0x05, 0x06, 0x05, 0x06, 0x06, 0x07,
    0x01, 0x02, 0x02, 0x03, 0x02, 0x03, 0x03, 0x04, 0x02, 0x03, 0x03, 0x04, 0x03, 0x04, 0x04, 0x05,
    0x02, 0x03, 0x03, 0x04, 0x03, 0x04, 0x04, 0x05, 0x03, 0x04, 0x04, 0x05, 0x04, 0x05, 0x05, 0x06,
    0x02, 0x03, 0x03, 0x04, 0x03, 0x04, 0x04, 0x05, 0x03, 0x04, 0x04, 0x05, 0x04, 0x05, 0x05, 0x06,
    0x03, 0x04, 0x04, 0x05, 0x04, 0x05, 0x05, 0x06, 0x04, 0x05, 0x05, 0x06, 0x05, 0x06, 0x06, 0x07,
    0x02, 0x03, 0x03, 0x04, 0x03, 0x04, 0x04, 0x05, 0x03, 0x04, 0x04, 0x05, 0x04, 0x05, 0x05, 0x06,
    0x03, 0x04, 0x04, 0x05, 0x04, 0x05, 0x05, 0x06, 0x04, 0x05, 0x05, 0x06, 0x05, 0x06, 0x06, 0x07,
    0x03, 0x04, 0x04, 0x05, 0x04, 0x05, 0x05, 0x06, 0x04, 0x05, 0x05, 0x06, 0x05, 0x06, 0x06, 0x07,
    0x04, 0x05, 0x05, 0x06, 0x05, 0x06, 0x06, 0x07, 0x05, 0x06, 0x06, 0x07, 0x06, 0x07, 0x07, 0x08].mapLiterals(uint8)

const rev8tab: array[256, uint8]= 
    [0x00, 0x80, 0x40, 0xc0, 0x20, 0xa0, 0x60, 0xe0, 0x10, 0x90, 0x50, 0xd0, 0x30, 0xb0, 0x70, 0xf0,
    0x08, 0x88, 0x48, 0xc8, 0x28, 0xa8, 0x68, 0xe8, 0x18, 0x98, 0x58, 0xd8, 0x38, 0xb8, 0x78, 0xf8,
    0x04, 0x84, 0x44, 0xc4, 0x24, 0xa4, 0x64, 0xe4, 0x14, 0x94, 0x54, 0xd4, 0x34, 0xb4, 0x74, 0xf4,
    0x0c, 0x8c, 0x4c, 0xcc, 0x2c, 0xac, 0x6c, 0xec, 0x1c, 0x9c, 0x5c, 0xdc, 0x3c, 0xbc, 0x7c, 0xfc,
    0x02, 0x82, 0x42, 0xc2, 0x22, 0xa2, 0x62, 0xe2, 0x12, 0x92, 0x52, 0xd2, 0x32, 0xb2, 0x72, 0xf2,
    0x0a, 0x8a, 0x4a, 0xca, 0x2a, 0xaa, 0x6a, 0xea, 0x1a, 0x9a, 0x5a, 0xda, 0x3a, 0xba, 0x7a, 0xfa,
    0x06, 0x86, 0x46, 0xc6, 0x26, 0xa6, 0x66, 0xe6, 0x16, 0x96, 0x56, 0xd6, 0x36, 0xb6, 0x76, 0xf6,
    0x0e, 0x8e, 0x4e, 0xce, 0x2e, 0xae, 0x6e, 0xee, 0x1e, 0x9e, 0x5e, 0xde, 0x3e, 0xbe, 0x7e, 0xfe,
    0x01, 0x81, 0x41, 0xc1, 0x21, 0xa1, 0x61, 0xe1, 0x11, 0x91, 0x51, 0xd1, 0x31, 0xb1, 0x71, 0xf1,
    0x09, 0x89, 0x49, 0xc9, 0x29, 0xa9, 0x69, 0xe9, 0x19, 0x99, 0x59, 0xd9, 0x39, 0xb9, 0x79, 0xf9,
    0x05, 0x85, 0x45, 0xc5, 0x25, 0xa5, 0x65, 0xe5, 0x15, 0x95, 0x55, 0xd5, 0x35, 0xb5, 0x75, 0xf5,
    0x0d, 0x8d, 0x4d, 0xcd, 0x2d, 0xad, 0x6d, 0xed, 0x1d, 0x9d, 0x5d, 0xdd, 0x3d, 0xbd, 0x7d, 0xfd,
    0x03, 0x83, 0x43, 0xc3, 0x23, 0xa3, 0x63, 0xe3, 0x13, 0x93, 0x53, 0xd3, 0x33, 0xb3, 0x73, 0xf3,
    0x0b, 0x8b, 0x4b, 0xcb, 0x2b, 0xab, 0x6b, 0xeb, 0x1b, 0x9b, 0x5b, 0xdb, 0x3b, 0xbb, 0x7b, 0xfb,
    0x07, 0x87, 0x47, 0xc7, 0x27, 0xa7, 0x67, 0xe7, 0x17, 0x97, 0x57, 0xd7, 0x37, 0xb7, 0x77, 0xf7,
    0x0f, 0x8f, 0x4f, 0xcf, 0x2f, 0xaf, 0x6f, 0xef, 0x1f, 0x9f, 0x5f, 0xdf, 0x3f, 0xbf, 0x7f, 0xff].mapLiterals(uint8)

const len8tab : array[256, uint8] = 
    [0x00, 0x01, 0x02, 0x02, 0x03, 0x03, 0x03, 0x03, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04, 0x04,
    0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05, 0x05,
    0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
    0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06, 0x06,
    0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
    0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
    0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
    0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07, 0x07,
    0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
    0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
    0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
    0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
    0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
    0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
    0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08,
    0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08, 0x08].mapLiterals(uint8)

const uintSize = 32 shl (not uint(0) shr 32 and 1) # 32 or 64

# UintSize is the size of a uint in bits.
const UintSize = uintSize

# --- Len ---
# Len32 returns the minimum number of bits required to represent x; the result is 0 for x == 0.
proc Len32(x: var uint32): int = 
    if x >= 1'u32 shl 16 :
        x = x shr 16
        result = 16

    if x >= 1'u32 shl 8 :
        x = x shr 8
        result += 8
    
    return result + int(len8tab[x])

    #Len64 returns the minimum number of bits required to represent x; the result is 0 for x == 0.
proc Len64(x: var uint64): int = 
    if x >= 1'u64 shl 32 :
        x = x shr 32
        result = 32

    if x >= 1'u64 shl 16 :
        x = x shr 16
        result += 16

    if x >= 1'u64 shl 8 :
        x = x shr 8
        result += 8

    result += int(len8tab[x])

# Len returns the minimum number of bits required to represent x; the result is 0 for x == 0.
proc Len(x: var uint): int = 
    if UintSize == 32 :
        var u32 = x.uint32
        return Len32(u32)
    var u64 = x.uint64
    return Len64(u64)

# Len8 returns the minimum number of bits required to represent x; the result is 0 for x == 0.
proc Len8(x: uint8): int =
    return int(len8tab[x])

# Len16 returns the minimum number of bits required to represent x; the result is 0 for x == 0.
proc Len16(x: var uint16): int =
    if x >= 1'u16 shl 8 :
        x = x shr 8
        result = 8
    result += int(len8tab[x])

# LeadingZeros returns the number of leading zero bits in x; the result is UintSize for x == 0.
proc LeadingZeros(x: var uint):int = UintSize - Len(x) 

# LeadingZeros8 returns the number of leading zero bits in x; the result is 8 for x == 0.
proc LeadingZeros8(x: var uint8): int = 8 - Len8(x) 

# LeadingZeros16 returns the number of leading zero bits in x; the result is 16 for x == 0.
proc LeadingZeros16(x: var uint16): int = 16 - Len16(x) 

# LeadingZeros32 returns the number of leading zero bits in x; the result is 32 for x == 0.
proc LeadingZeros32(x: var uint32): int = 32 - Len32(x) 

# LeadingZeros64 returns the number of leading zero bits in x; the result is 64 for x == 0.
proc LeadingZeros64(x: var uint64): int = 64 - Len64(x) 

# --- TrailingZeros ---

# See http://supertech.csail.mit.edu/papers/debruijn.pdf
const deBruijn32 = 0x077CB531

var deBruijn32tab : array[32,int] = 
    [0, 1, 28, 2, 29, 14, 24, 3, 30, 22, 20, 15, 25, 17, 4, 8,
    31, 27, 13, 23, 21, 19, 16, 7, 26, 12, 18, 6, 11, 5, 10, 9]

const deBruijn64 = 0x03f79d71b4ca8b09

var deBruijn64tab : array[64, int] = 
    [0, 1, 56, 2, 57, 49, 28, 3, 61, 58, 42, 50, 38, 29, 17, 4,
    62, 47, 59, 36, 45, 43, 51, 22, 53, 39, 33, 30, 24, 18, 12, 5,
    63, 55, 48, 27, 60, 41, 37, 16, 46, 35, 44, 21, 52, 32, 23, 11,
    54, 26, 40, 15, 34, 20, 31, 10, 25, 14, 19, 9, 13, 8, 7, 6]

# TrailingZeros32 returns the number of trailing zero bits in x; the result is 32 for x == 0.
proc TrailingZeros32(x: int32): int =
    if x == 0 :
        return 32
    result = deBruijn32tab[(x and -x) * deBruijn32 shr(32-5)]

# TrailingZeros64 returns the number of trailing zero bits in x; the result is 64 for x == 0.
proc TrailingZeros64(x: int64): int =    
    if x == 0 :    
        return 64
    # If popcount is fast, replace code below with return popcount(!x: and (x - 1)).
    #
    # x: and -x: leaves only the right-most bit set in the word. Let k be the
    # index: of that bit. Since only a single bit is set, the value is two
    # to the power of k. Multiplying by a power of two is equivalent to
    # left shifting, in this case by k bits. The de Bruijn (64 bit): constant
    # is such that all six: bit, consecutive substrings are distinct.
    # Therefore, if we have a left shifted version of this constant we can
    # find by how many bits it was shifted by looking at which six: bit
    # substring ended up at the top of the word.
    # (Knuth, volume 4, section 7.3.1)
    return int(deBruijn64tab[(x and -x) * deBruijn64 shr(64-6)])
# TrailingZeros returns the number of trailing zero bits in x; the result is UintSize for x == 0.
proc TrailingZeros(x: int): int =
    if UintSize == 32 :
        return TrailingZeros32(x.int32)
    return TrailingZeros64(x)

# TrailingZeros8 returns the number of trailing zero bits in x; the result is 8 for x == 0.
proc TrailingZeros8(x: uint8): int = ntz8tab[x].int
    

# TrailingZeros16 returns the number of trailing zero bits in x; the result is 16 for x == 0.
proc TrailingZeros16(x: int32): int = 
    if x == 0:     
        return 16
    result = deBruijn32tab[uint32(x and -x) * deBruijn32 shr(32-5)]

# --- OnesCount ---

const m0 = 0x5555555555555555 # 01010101 ...
const m1 = 0x3333333333333333 # 00110011 ...
const m2 = 0x0f0f0f0f0f0f0f0f # 00001111 ...
const m3 = 0x00ff00ff00ff00ff # etc.
const m4 = 0x0000ffff0000ffff

# OnesCount32 returns the number of one bits ("population count"): in x.
proc OnesCount32(x: uint32): int =  
    return int(pop8tab[x shr 24] + pop8tab[x shr 16 and 0xff] + pop8tab[x shr 8 and 0xff] + pop8tab[x and 0xff])

# OnesCount64 returns the number of one bits ("population count"): in x.
proc OnesCount64(x: uint64): int =  
    # Implementation: Parallel summing of adjacent bits.
    # See "Hacker's Delight", Chap. 5: Counting Bits.
    # The following pattern shows the general approach:
    #
    #   x = x shr 1 and (m0 and m) + xand(m0 and m)
    #   x = x shr 2 and (m1 and m) + xand(m1 and m)
    #   x = x shr 4 and (m2 and m) + xand(m2 and m)
    #   x = x shr 8 and (m3 and m) + xand(m3 and m)
    #   x = x shr 16 and (m4 and m) + xand(m4 and m)
    #   x = x shr 32 and (m5 and m) + xand(m5 and m)
    #   return int(x)
    #
    # Masking (and operations): can be left away when there's no
    # danger that a field's sum will carry over into the next
    # field: Since the result cannot be > 64, 8 bits is enough
    # and we can ignore the masks for the shifts by 8 and up.
    # Per "Hacker's Delight", the first line can be simplified
    # more, but it saves at best one instruction, so we leave
    # it alone for clarity.
    const m = 1 shl 64 - 1
    var i64: int64 = x.int64
    i64 = i64 shr 1 and(m0 and m) + i64 and(m0 and m)
    i64 = i64 shr 2 and(m1 and m) + i64 and(m1 and m)
    i64 = (i64 shr 4 + i64) and (m2 and m)
    i64 += i64 shr 8
    i64 += i64 shr 16
    i64 += i64 shr 32
    return int(i64) and (1 shl 7 - 1)
# OnesCount returns the number of one bits ("population count"): in x.

proc OnesCount(x: var uint): int = 
    if UintSize == 32:
        return OnesCount32(uint32(x))
    result = OnesCount64(x)
    

# OnesCount8 returns the number of one bits ("population count"): in x.
proc OnesCount8(x: uint8): int = pop8tab[x].int
    

# OnesCount16 returns the number of one bits ("population count"): in x.
proc OnesCount16(x: uint16): int =  int pop8tab[x shr 8] + pop8tab[x and 0xff]
    
# --- RotateLeft ---

# RotateLeft8 returns the value of x: rotated left by (k mod 8): bits.
# To rotate x: right by k bits, call RotateLeft8(x, -k).
proc RotateLeft8(x: uint8, k: int): uint8 =   
    const n = 8
    var s = uint(k) and (n - 1)
    return x shl s or x shr(n - s.int)

# RotateLeft16 returns the value of x: rotated left by (k mod 16): bits.
# To rotate x: right by k bits, call RotateLeft16(x, -k).
proc RotateLeft16(x: uint16, k: int): uint16 =    
    const n = 16
    var s = uint(k) and (n - 1)
    return x shl s or x shr(n-s.int)

# RotateLeft32 returns the value of x: rotated left by (k mod 32): bits.
# To rotate x: right by k bits, call RotateLeft32(x, -k).
proc RotateLeft32(x: uint32, k: int): uint32 =  
    const n = 32
    var s = uint(k) and (n - 1)
    return x shl s or x shr(n - s.int)

# RotateLeft64 returns the value of x: rotated left by (k mod 64): bits.
# To rotate x: right by k bits, call RotateLeft64(x, -k).
proc RotateLeft64(x: uint64, k: int): uint64 =  
    const n = 64
    var s = uint(k) and (n - 1)
    return x shl s or x shr(n - s.int)
# RotateLeft returns the value of x: rotated left by (k mod UintSize): bits.
# To rotate x: right by k bits, call RotateLeft(x, -k).
proc RotateLeft(x: uint, k: int): uint =    
    if UintSize == 32:  
        return uint(RotateLeft32(uint32(x), k))
    return uint(RotateLeft64(uint64(x), k))

# --- Reverse ---
# Reverse32 returns the value of x: with its bits in reversed order.
proc Reverse32(x: uint32): uint32 =   
    const m = 1 shl 32 - 1
    var i64 = x.int64
    i64 = i64 shr 1 and (m0 and m) or i64 and(m0 and m) shl 1
    i64 = i64 shr 2 and (m1 and m) or i64 and(m1 and m) shl 2
    i64 = i64 shr 4 and (m2 and m) or i64 and(m2 and m) shl 4
    i64 = i64 shr 8 and (m3 and m) or i64 and(m3 and m) shl 8
    result = uint32 i64 shr 16 or i64 shl 16

# Reverse64 returns the value of x: with its bits in reversed order.
proc Reverse64(x: uint64): uint64 = 
    const m = 1 shl 64 - 1
    var i64 = x.int64
    i64 = i64 shr 1 and (m0 and m) or i64 and(m0 and m)shl 1
    i64 = i64 shr 2 and (m1 and m) or i64 and(m1 and m)shl 2
    i64 = i64 shr 4 and (m2 and m) or i64 and(m2 and m)shl 4
    i64 = i64 shr 8 and (m3 and m) or i64 and(m3 and m)shl 8
    i64 = i64 shr 16 and (m4 and m) or i64 and(m4 and m)shl 16
    return uint64 i64 shr 32 or i64 shl 32
# Reverse returns the value of x: with its bits in reversed order.
proc Reverse(x: uint): uint =
    if UintSize == 32:  
        return uint(Reverse32(uint32(x)))
    return uint(Reverse64(uint64(x)))
    

# Reverse8 returns the value of x: with its bits in reversed order.
proc Reverse8(x: uint8): uint8 = rev8tab[x]

# Reverse16 returns the value of x: with its bits in reversed order.
proc Reverse16(x: uint16): uint16 = uint16(rev8tab[x shr 8]) or uint16(rev8tab[x and 0xff]) shl 8


# --- ReverseBytes ---

# ReverseBytes16 returns the value of x: with its bytes in reversed order.
proc ReverseBytes16(x: uint16): uint16 = x shr 8 or x shl 8

# ReverseBytes32 returns the value of x: with its bytes in reversed order.
proc ReverseBytes32(x: uint32): uint32 =   
    const m = 1 shl 32 - 1
    var i64 = x.int64
    i64 = i64 shr 8 and(m3 and m) or i64 and(m3 and m) shl 8
    return uint32 i64 shr 16 or i64 shl 16

# ReverseBytes64 returns the value of x: with its bytes in reversed order.
proc ReverseBytes64(x: uint64): uint64 = 
    const m = 1 shl 64 - 1
    var i64 = x.int64

    i64 = i64 shr 8 and (m3 and m) or i64 and(m3 and m) shl 8
    i64 = i64 shr 16 and (m4 and m) or i64 and(m4 and m)shl 16
    return uint64 i64 shr 32 or i64 shl 32

# ReverseBytes returns the value of x: with its bytes in reversed order.
proc ReverseBytes(x: uint): uint =     
    if UintSize == 32:  
        return uint(ReverseBytes32(uint32(x)))
        
    return uint(ReverseBytes64(uint64(x)))
    

