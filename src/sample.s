 TITLE '/home/mike/repos/crent370_example/src/sample.c'
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
         EJECT
* external function 'sample_wto_greeting' prologue
* frame base=88, local stack=80, call args=8
&FUNC    SETC  'sample_wto_greeting'
TST0001  PDPPRLG CINDEX=0,FRAME=176,BASER=12,ENTRY=YES
         B     @@FEN0
         LTORG
@@FEN0   EQU   *
         DROP  12
         BALR  12,0
         USING *,12
@@PG0    EQU   *
         LR    11,1
         L     10,=A(@@PGT0)
* Function 'sample_wto_greeting' code
         LA    2,96(,13)
         ST    2,88(13)
         MVC   92(4,13),0(11) ==> name
         LA    1,88(,13)
         L     15,=A(@@6)
         BALR  14,15
         LTR   15,15 ==> result
         BE    @@L2
         MVC   88(4,13),=A(@@LC0)
         LA    1,88(,13)
         L     15,=V(WTOF)
         BALR  14,15
         LA    15,1(0,0) ==> result
         B     @@L1
@@L2     EQU   *
         MVC   88(4,13),=A(@@LC1)
         LA    2,96(,13)
         ST    2,92(13)
         LA    1,88(,13)
         L     15,=V(WTOF)
         BALR  14,15
         SLR   15,15 ==> result
@@L1     EQU   *
* Function 'sample_wto_greeting' epilogue
         PDPEPIL
* Function 'sample_wto_greeting' literal pool
         DS    0D
         LTORG
* Function 'sample_wto_greeting' page table
@@PGT0   DS    0F
         DC    A(@@PG0)
@@LC0    EQU   *
         DC    C'DMY01E Error formatting greeting message'
         DC    X'15'
         DC    X'0'
@@LC1    EQU   *
         DC    C'DMY01I %s'
         DC    X'15'
         DC    X'0'
         DS    0F
         EJECT
* external function 'sample_tso_greeting' prologue
* frame base=88, local stack=80, call args=8
&FUNC    SETC  'sample_tso_greeting'
TST0002  PDPPRLG CINDEX=1,FRAME=176,BASER=12,ENTRY=YES
         B     @@FEN1
         LTORG
@@FEN1   EQU   *
         DROP  12
         BALR  12,0
         USING *,12
@@PG1    EQU   *
         LR    11,1
         L     10,=A(@@PGT1)
* Function 'sample_tso_greeting' code
         LA    2,96(,13)
         ST    2,88(13)
         MVC   92(4,13),0(11) ==> name
         LA    1,88(,13)
         L     15,=A(@@6)
         BALR  14,15
         LTR   15,15 ==> result
         BE    @@L4
         MVC   88(4,13),=A(@@LC2)
         LA    1,88(,13)
         L     15,=V(PRINTF)
         BALR  14,15
         LA    15,1(0,0) ==> result
         B     @@L3
@@L4     EQU   *
         MVC   88(4,13),=A(@@LC3)
         LA    2,96(,13)
         ST    2,92(13)
         LA    1,88(,13)
         L     15,=V(PRINTF)
         BALR  14,15
         SLR   15,15 ==> result
@@L3     EQU   *
* Function 'sample_tso_greeting' epilogue
         PDPEPIL
* Function 'sample_tso_greeting' literal pool
         DS    0D
         LTORG
* Function 'sample_tso_greeting' page table
@@PGT1   DS    0F
         DC    A(@@PG1)
@@LC2    EQU   *
         DC    C'Error formatting greeting message'
         DC    X'15'
         DC    X'0'
@@LC3    EQU   *
         DC    C'%s'
         DC    X'15'
         DC    X'0'
         
&FUNC    SETC 'format_greeting'
         DS    0F
         EJECT
* static function 'format_greeting' prologue
* frame base=88, local stack=0, call args=8
&FUNC    SETC  'format_greeting'
@@6      PDPPRLG CINDEX=2,FRAME=96,BASER=12,ENTRY=NO
         B     @@FEN2
         LTORG
@@FEN2   EQU   *
         DROP  12
         BALR  12,0
         USING *,12
@@PG2    EQU   *
         LR    11,1
         L     10,=A(@@PGT2)
* Function 'format_greeting' code
         L     2,0(11) ==> buffer
         L     3,4(11) ==> name
         LTR   2,2 ==> buffer
         BE    @@L7
         LTR   3,3 ==> name
         BNE   @@L6
@@L7     EQU   *
         LA    15,1(0,0)
         B     @@L5
@@L6     EQU   *
         ST    2,88(13) ==> buffer
         MVC   92(4,13),=A(@@LC4)
         LA    1,88(,13)
         L     15,=V(STRCPY)
         BALR  14,15
         ST    2,88(13) ==> buffer
         ST    3,92(13) ==> name
         LA    1,88(,13)
         L     15,=V(STRCAT)
         BALR  14,15
         ST    2,88(13) ==> buffer
         MVC   92(4,13),=A(@@LC5)
         LA    1,88(,13)
         L     15,=V(STRCAT)
         BALR  14,15
         SLR   15,15
@@L5     EQU   *
* Function 'format_greeting' epilogue
         PDPEPIL
* Function 'format_greeting' literal pool
         DS    0D
         LTORG
* Function 'format_greeting' page table
@@PGT2   DS    0F
         DC    A(@@PG2)
@@LC4    EQU   *
         DC    C'Hello, '
         DC    X'0'
@@LC5    EQU   *
         DC    C'! Welcome to MVS 3.8j programming.'
         DC    X'0'
         END
