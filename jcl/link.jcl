//LKDSAMPL JOB CLASS=A,REGION=0K,MSGCLASS=H             
//*                                                                    
//LINK     EXEC PGM=IEWL,PARM='LIST,MAP,XREF,RENT'                     
//SYSPRINT DD SYSOUT=*                                                 
//SYSLIB   DD DISP=SHR,DSN=CRENT370.NCALIB,DCB=BLKSIZE=32760           
//SYSLMOD  DD DISP=SHR,DSN=USER.SAMPLE.LOAD                         
//SYSUT1   DD UNIT=SYSALLDA,SPACE=(CYL,(2,1))                          
//NCALIB   DD DISP=SHR,DSN=USER.SAMPLE.NCALIB                       
//SYSLIN   DD DDNAME=SYSIN                                             
//SYSIN    DD *                                                        
  INCLUDE SYSLIB(@@CRT0)                                               
  INCLUDE NCALIB(SAMPLE)                                               
  INCLUDE NCALIB(MAIN)                                                 
  ENTRY @@CRT0                                                         
  NAME SAMPLE(R)                                                       
/*                                                                     
//*                                                                    