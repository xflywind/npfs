/* Generated by Nim Compiler v0.18.1 */
/*   (c) 2018 Andreas Rumpf */
/* The generated code is subject to the original license. */
/* Compiled for: Linux, amd64, gcc */
/* Command for C compiler:
   gcc -c  -w  -I/mnt/d/Nim/lib -o /mnt/d/npfs/nim-merkle-dag/nimcache/stdlib_ospaths.c.o /mnt/d/npfs/nim-merkle-dag/nimcache/stdlib_ospaths.c */
#define NIM_NEW_MANGLING_RULES
#define NIM_INTBITS 64

#include "nimbase.h"
#undef LANGUAGE_C
#undef MIPSEB
#undef MIPSEL
#undef PPC
#undef R3000
#undef R4000
#undef i386
#undef linux
#undef mips
#undef near
#undef far
#undef powerpc
#undef unix
typedef struct tySequence_sM4lkSb7zS6F7OVMvW9cffQ tySequence_sM4lkSb7zS6F7OVMvW9cffQ;
typedef struct NimStringDesc NimStringDesc;
typedef struct TGenericSeq TGenericSeq;
typedef struct TNimType TNimType;
typedef struct TNimNode TNimNode;
struct TGenericSeq {
NI len;
NI reserved;
};
struct NimStringDesc {
  TGenericSeq Sup;
NIM_CHAR data[SEQ_DECL_SIZE];
};
typedef NU8 tyEnum_TNimKind_jIBKr1ejBgsfM33Kxw4j7A;
typedef NU8 tySet_tyEnum_TNimTypeFlag_v8QUszD1sWlSIWZz7mC4bQ;
typedef N_NIMCALL_PTR(void, tyProc_ojoeKfW4VYIm36I9cpDTQIg) (void* p, NI op);
typedef N_NIMCALL_PTR(void*, tyProc_WSm2xU5ARYv9aAR4l0z9c9auQ) (void* p);
struct TNimType {
NI size;
tyEnum_TNimKind_jIBKr1ejBgsfM33Kxw4j7A kind;
tySet_tyEnum_TNimTypeFlag_v8QUszD1sWlSIWZz7mC4bQ flags;
TNimType* base;
TNimNode* node;
void* finalizer;
tyProc_ojoeKfW4VYIm36I9cpDTQIg marker;
tyProc_WSm2xU5ARYv9aAR4l0z9c9auQ deepcopy;
};
typedef NU8 tyEnum_TNimNodeKind_unfNsxrcATrufDZmpBq4HQ;
struct TNimNode {
tyEnum_TNimNodeKind_unfNsxrcATrufDZmpBq4HQ kind;
NI offset;
TNimType* typ;
NCSTRING name;
NI len;
TNimNode** sons;
};
typedef N_NIMCALL_PTR(void, tyProc_T4eqaYlFJYZUv9aG9b1TV0bQ) (void);
struct tySequence_sM4lkSb7zS6F7OVMvW9cffQ {
  TGenericSeq Sup;
  NimStringDesc* data[SEQ_DECL_SIZE];
};
N_NIMCALL(void, nimGCvisit)(void* d, NI op);
static N_NIMCALL(void, Marker_tySequence_sM4lkSb7zS6F7OVMvW9cffQ)(void* p, NI op);
static N_NIMCALL(void, TM_jvWQYw9bcuYhftfPX2ynPeg_2)(void);
N_NIMCALL(void, nimRegisterThreadLocalMarker)(tyProc_T4eqaYlFJYZUv9aG9b1TV0bQ markerProc);
static N_INLINE(void, nimFrame)(TFrame* s);
N_LIB_PRIVATE N_NOINLINE(void, stackOverflow_II46IjNZztN9bmbxUD8dt8g)(void);
static N_INLINE(void, popFrame)(void);
NIM_BOOL envComputed_OC1kQm9aRvX8VnmaXglp57Q;
tySequence_sM4lkSb7zS6F7OVMvW9cffQ* environment_rnCB7Cc69bd2mlM49cn9czO2Q;
extern TNimType NTI_77mFvmsOLKik79ci2hXkHEg_;
TNimType NTI_sM4lkSb7zS6F7OVMvW9cffQ_;
extern NCSTRING* environ;
extern TFrame* framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw;
static N_NIMCALL(void, Marker_tySequence_sM4lkSb7zS6F7OVMvW9cffQ)(void* p, NI op) {
	tySequence_sM4lkSb7zS6F7OVMvW9cffQ* a;
	NI T1_;
	a = (tySequence_sM4lkSb7zS6F7OVMvW9cffQ*)p;
	T1_ = (NI)0;
	for (T1_ = 0; T1_ < a->Sup.len; T1_++) {
	nimGCvisit((void*)a->data[T1_], op);
	}
}
static N_NIMCALL(void, TM_jvWQYw9bcuYhftfPX2ynPeg_2)(void) {
	nimGCvisit((void*)environment_rnCB7Cc69bd2mlM49cn9czO2Q, 0);
}

static N_INLINE(void, nimFrame)(TFrame* s) {
	NI T1_;
	T1_ = (NI)0;
	{
		if (!(framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw == NIM_NIL)) goto LA4_;
		T1_ = ((NI) 0);
	}
	goto LA2_;
	LA4_: ;
	{
		T1_ = ((NI) ((NI16)((*framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw).calldepth + ((NI16) 1))));
	}
	LA2_: ;
	(*s).calldepth = ((NI16) (T1_));
	(*s).prev = framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw;
	framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw = s;
	{
		if (!((*s).calldepth == ((NI16) 2000))) goto LA9_;
		stackOverflow_II46IjNZztN9bmbxUD8dt8g();
	}
	LA9_: ;
}

static N_INLINE(void, popFrame)(void) {
	framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw = (*framePtr_HRfVMH3jYeBJz6Q6X9b6Ptw).prev;
}
N_LIB_PRIVATE N_NIMCALL(void, stdlib_ospathsInit000)(void) {
	nimfr_("ospaths", "ospaths.nim");
nimRegisterThreadLocalMarker(TM_jvWQYw9bcuYhftfPX2ynPeg_2);
	popFrame();
}

N_LIB_PRIVATE N_NIMCALL(void, stdlib_ospathsDatInit000)(void) {
NTI_sM4lkSb7zS6F7OVMvW9cffQ_.size = sizeof(tySequence_sM4lkSb7zS6F7OVMvW9cffQ*);
NTI_sM4lkSb7zS6F7OVMvW9cffQ_.kind = 24;
NTI_sM4lkSb7zS6F7OVMvW9cffQ_.base = (&NTI_77mFvmsOLKik79ci2hXkHEg_);
NTI_sM4lkSb7zS6F7OVMvW9cffQ_.flags = 2;
NTI_sM4lkSb7zS6F7OVMvW9cffQ_.marker = Marker_tySequence_sM4lkSb7zS6F7OVMvW9cffQ;
}

