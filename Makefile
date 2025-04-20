INC1 := -I./inc
INC2 := -I./contrib/crent370_sdk/inc
INCS := $(INC1) $(INC2)
CC := c2asm370

CFLAGS := -fverbose-asm -S -O1 $(INCS)

# Project configuration
PROJECT_HLQ := FIX0MIG.SAMPLE

# c source code files
C_FILES := 				\
		src/sample.c	\
		src/main.c

# generated .s assembler source files (one for each source file)
S_FILES := $(foreach filename,$(C_FILES),$(filename:.c=.s))

# object files (one for each .c and .asm source file)
O_FILES := $(foreach filename,$(C_FILES),$(filename:.c=.o)) \
           $(foreach filename,$(A_FILES),$(filename:.asm=.o))

# expoort MSGCLASS
export MSGCLASS=H
# export MACn variables for mvsasm->jobasm script
export MAC1=CRENT370.MACLIB

# export dataset names used by mvsasm script
export MVSASM_PUNCH=$(PROJECT_HLQ).OBJECT
export MVSASM_SYSLMOD=$(PROJECT_HLQ).NCALIB

all: $(S_FILES) $(O_FILES)
	@echo "Done"
# Note: PHONY is important here. Without it, implicit rules will try
#       to build the executable "all", since the prereqs are ".o" files.
.PHONY: all 

# build object files from the generated assembler files (.s)
%.o: %.s
	@echo "mvsasm $(notdir $<)"
	@mvsasm "$<"
	@touch "$@"

# build object files from assembler files (.asm)
%.o: %.asm
	@echo "mvsasm $(notdir $<)"
	@mvsasm "$<"
	@touch "$@"

# compile C source files (.c) into assembler files (.s)
%.s: %.c
	@echo "Compile $(notdir $<)"
	$(CC) $(CFLAGS) -c $< -o $@

# remove generated files
clean:
	@rm -f $(S_FILES) $(O_FILES)
