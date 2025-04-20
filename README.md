# CRENT370 Example Project

This repository serves as a skeleton project for developing IBM MVS 3.8j applications in C using the CRENT370 C library. It demonstrates the setup, coding, and build process for mainframe applications with modern cross-compilation tools.

## Project Structure

- `src/` - Source code files (.c)
- `inc/` - Header files (.h)
- `jcl/` - JCL templates for mainframe jobs
- `contrib/` - Dependencies (CRENT370 SDK)

## Sample Application

The project includes a simple sample application that demonstrates two types of output:

1. **WTO-Greeting** (Write to Operator) - Sends messages to the system console
2. **TSO-Greeting** - Displays output on the TSO terminal

## Prerequisites

### On the Host / Mainframe
- A host installation of CRENT370 ([GitHub Releases](https://github.com/mvslovers/crent370/releases))
- Project datasets with the following attributes:

#### OBJECT Dataset
```
NAME OF NEW DATA SET ==> 'USER.SAMPLE.OBJECT'         
        RECORD FORMAT ==> FB                              
LOGICAL RECORD LENGTH ==> 80                              
  PHYSICAL BLOCK SIZE ==> 3120                            
               VOLUME ==> PUB000                          
                 UNIT ==>                                 
ALLOCATION SPACE UNIT ==> T       ( T OR C OR B )         
PRIMARY SPACE QUANTITY ==> 600                             
SECONDARY SPACE QUANTITY ==> 10                              
NUMBER OF DIRECTORY BLOCKS ==> 100 
```

#### NCALIB Dataset
```
NAME OF NEW DATA SET ==> 'USER.SAMPLE.NCALIB'             
        RECORD FORMAT ==> U                                   
LOGICAL RECORD LENGTH ==> 0                                   
  PHYSICAL BLOCK SIZE ==> 15040                               
               VOLUME ==> PUB000                              
                 UNIT ==>                                     
ALLOCATION SPACE UNIT ==> T       ( T OR C OR B )             
PRIMARY SPACE QUANTITY ==> 600                                 
SECONDARY SPACE QUANTITY ==> 100                                 
NUMBER OF DIRECTORY BLOCKS ==> 200
```

#### LOAD Dataset
```
NAME OF NEW DATA SET ==> 'USER.SAMPLE.LOAD'          
       RECORD FORMAT ==> U                              
LOGICAL RECORD LENGTH ==> 19069                          
  PHYSICAL BLOCK SIZE ==> 19069                          
              VOLUME ==> PUB000                         
                UNIT ==>                                
ALLOCATION SPACE UNIT ==> T       ( T OR C OR B )        
PRIMARY SPACE QUANTITY ==> 139                            
SECONDARY SPACE QUANTITY ==> 1                              
NUMBER OF DIRECTORY BLOCKS ==> 10
```

### On the Development System
- **Cross-compiler**: gccmvs or c2asm370
- **CRENT370 header files**: Included in the contrib folder of this project
- **Additional Tools** (to be completed)
  - mvsasm
  - another tool 1
  - another tool 2

## Configuration

The build configuration can be adjusted in the `Makefile`. The most important parameter is:

```
PROJECT_HLQ := USER.SAMPLE
```

This sets the High-Level Qualifier for all project datasets.

## Development Workflow & Build Process

The development and build process consists of these steps:

1. **Create or edit source code** in src/ and inc/

2. **C to Assembler Conversion**:
   ```
   make
   ```
   This command invokes gccmvs or c2asm370 to convert C code into assembler code. For each C file, a corresponding .s assembler file is generated.

3. **Assembler Compilation**:
   The `mvsasm` tool generates a JCL for each .s file and submits it for compilation on the mainframe system. The compiled objects are stored in the OBJECT dataset and then added to the NCALIB dataset.

4. **Linking**:
   After compiling all components, submit the link job:
   ```
   cat jcl/link.jcl | submit_jcl
   ```
   A template for this is available in `jcl/link.jcl`.

5. **Execute** the resulting load module on the mainframe

## Resources

- [CRENT370 Repository](https://github.com/mvslovers/crent370)
- [GCCMVS Cross Compiler](http://gccmvs.sourceforge.net/)

## License

See LICENSE file.