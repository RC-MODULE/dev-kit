
SHELL	=cmd
OS_RM   =cmd /c del /Q
ROOT    =../../..
export PATH:=$(PATH);$(realpath $(ROOT)/bin)

DEVKIT ?=../$(ROOT)
MC5103 ?= $(DEVKIT)/mc5103sdk
all: nm_part.abs host.exe hostrpc.exe

nm_part.abs: nm_part.cpp
	nmcpp -6405 nm_part.cpp -I$(MC5103)/include  -I$(NEURO)/include 	
	asm -6405 nm_part.asm
	linker nm_part.elf -l"$(NEURO)/lib"  mc5103lib.lib libint05.lib libc05.lib -cmc5103brd.cfg -m -l$(MC5103)/lib

host.exe: host.cpp
	"$(VS80COMNTOOLS)..\..\vc\vcvarsall.bat" && cl host.cpp $(MC5103)/libload/mc5103load.lib -I$(MC5103)/libload /MT /EHsc 

hostrpc.exe: host.cpp
	"$(VS80COMNTOOLS)..\..\vc\vcvarsall.bat" && cl host.cpp $(ROOT)\lib\nmClientLoad-x86.lib -I$(MC5103)\libload /MT /EHsc /Fehostrpc
	
run: hostrpc.exe
	hostrpc
	
test: host.exe
	host

clean:
	$(OS_RM) *.elf *.exe *.map *.obj *.abs *.asm