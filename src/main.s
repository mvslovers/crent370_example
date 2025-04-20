 TITLE '/home/mike/repos/crent370_example/src/main.c'
         COPY  PDPTOP
         CSECT
* GNU C version 3.2.3 - c2asm370 version 1.1 (mvs)
*        compiled by GNU C version 11.4.0.
*
* options passed:  -lang-c -I./inc -I./contrib/crent370_sdk/inc
* -iprefix -D__GNUC__=3 -D__GNUC_MINOR__=2 -D__GNUC_PATCHLEVEL__=3
* -D__GXX_ABI_VERSION=102 -D__GCC__ -D__MVS__ -D__GCC__ -D__MVS__
* -Asystem=mvs -Acpu=i370 -Amachine=i370 -D__OPTIMIZE__
* -D__STDC_HOSTED__=1 -trigraphs -O1 -fverbose-asm
* 
* options enabled:  -fdefer-pop -fthread-jumps -fpeephole
* -ffunction-cse -fkeep-static-consts -fpcc-struct-return -fgcse-lm
* -fgcse-sm -fsched-interblock -fsched-spec -fbranch-count-reg
* -fcprop-registers -fcommon -fverbose-asm -fgnu-linker
* -fargument-alias -fmerge-constants -fident
* -fguess-branch-probability -fmath-errno -ftrapping-math
* -mchar-instructions -mno-pickax -mno-constants-first
*
* Program text area
         DS    0F
         COPY  PDPMAIN
         EJECT
* external function 'main' prologue
* frame base=88, local stack=16, call args=8
&FUNC    SETC  'main'
MAIN     PDPPRLG CINDEX=0,FRAME=112,BASER=12,ENTRY=YES
         B     @@FEN0
         LTORG
@@FEN0   EQU   *
         DROP  12
         BALR  12,0
         USING *,12
@@PG0    EQU   *
         LR    11,1
         L     10,=A(@@PGT0)
* Function 'main' code
         L     2,=A(@@LC0)
         MVC   96(9,13),0(2) ==> username
         LA    2,96(,13)
         ST    2,88(13)
         LA    1,88(,13)
         L     15,=V(TST0001)
         BALR  14,15
         LTR   15,15 ==> rc
         BE    @@L2
         MVC   88(4,13),=A(@@LC1)
         ST    15,92(13) ==> rc
         LA    1,88(,13)
         L     15,=V(PRINTF)
         BALR  14,15
         LA    15,1(0,0) ==> rc
         B     @@L1
@@L2     EQU   *
         LA    2,96(,13)
         ST    2,88(13)
         LA    1,88(,13)
         L     15,=V(TST0002)
         BALR  14,15
         LTR   15,15 ==> rc
         BE    @@L3
         MVC   88(4,13),=A(@@LC2)
         ST    15,92(13) ==> rc
         LA    1,88(,13)
         L     15,=V(PRINTF)
         BALR  14,15
         LA    15,2(0,0) ==> rc
         B     @@L1
@@L3     EQU   *
         SLR   15,15 ==> rc
@@L1     EQU   *
* Function 'main' epilogue
         PDPEPIL
* Function 'main' literal pool
         DS    0D
         LTORG
* Function 'main' page table
@@PGT0   DS    0F
         DC    A(@@PG0)
@@LC0    EQU   *
         DC    C'TSO_USER'
         DC    X'0'
@@LC1    EQU   *
         DC    C'WTO greeting failed with rc=%d'
         DC    X'15'
         DC    X'0'
@@LC2    EQU   *
         DC    C'TSO greeting failed with rc=%d'
         DC    X'15'
         DC    X'0'
         END   @@MAIN
