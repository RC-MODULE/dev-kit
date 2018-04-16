######################  dev-pack 1.0 #####################################
#                                                                        #
#        NMC-ARM TOOL/SDK/TOOLCHAIN/LIBRARIES Downloader                 #
#                                                                        #
# MAIN TARGETS:                                                          #
#                                                                        #
# make install                                                           #
#   make    install-nmc                                                  #
#   make    install-gnu                                                  #
#   make    install-arm                                                  #
# make download                                                          #
#   make    download-nmc                                                 #
#   make    download-gnu                                                 #
#   make    download-arm                                                 #
#                                                                        #
##########################################################################
-include proxy-wget.mk
-include proxy.mk
#define proxy setting if required in proxy.mk like:
#export  https_proxy=http://login:pass@proxyserver:port
#export  http_proxy =http://login:pass@proxyserver:port
SETENV  =n

ifeq ($(OS),Windows_NT)
SHELL       = cmd
else

endif

OS_RM    = del /Q
OS_RD    = rd /Q /S 
OS_WGET  = wget -nc --no-check-certificate --content-disposition --tries=2
OS_UNZIP = unzip -u -o -q 
OS_GZIP  = gzip -d -f -k -v
OS_TAR   = tar -xf
#USER     =u
export NEURO = $(realpath ./nmsdk)
export PATH := $(NEURO)/bin;$(PATH);



  
# SDK/LIBRARIES/TOOLS/TOOLCHAINS:
  NMSDK_URL          = http://www.module.ru/mb7707/toolchains-neuromatrix/nmsdk307en_20170622.zip
  #NMSDK_URL         = http://www.module.ru/mb7707/toolchains-neuromatrix/nmsdk-20160804.tar.gz
  #NMSDK_TAR   		 = $(notdir $(basename $(NMSDK_URL)))
  VCREDIST_URL       = https://download.microsoft.com/download/e/1/c/e1c773de-73ba-494a-a5ba-f24906ecf088/vcredist_x86.exe
  VCREDIST13_URL     = https://download.microsoft.com/download/4/9/B/49BAC912-B6EF-4A34-A17C-06673338A7FC/vcredist_x64.exe

# x86-development shells, nm-tools & addons
  VSHELL32_DIST      = http://www.module.ru/mb7707/NeuroMatrix/VSHELL32_1.0.0.26.exe
  VSHELL32_URL       = http://www.module.ru/mb7707/NeuroMatrix/VSHELL32.ZIP
  NMCALC_URL         = http://www.module.ru/mb7707/NeuroMatrix/nmcalculator.zip 
  HIGHLIGHTER_URL    = https://github.com/RC-MODULE/asm-highlighter/archive/master.zip  

NMC_URLS = \
	$(NMSDK_URL)      \
	$(VCREDIST_URL)	  \
	$(NMCALC_URL)     \
	$(MC5103SDK_URL) \
	$(MC7601SDK_URL) \
	$(MB7707SDK_URL) \
	$(EDCLTOOL_URL)   \
	$(WINPCAP_URL)
	
# NMC Board support:
  MC5103SDK_URL      = http://www.module.ru/mb7707/NeuroMatrix/boards/mc5103_distrib.zip
  MC7601SDK_URL      = http://www.module.ru/mb7707/NeuroMatrix/boards/mc7601_distrib_non_official.zip
  MC12101SDK_URL     = http://www.module.ru/mb7707/NeuroMatrix/boards/mc12101_v_03_03_x32.zip
  MB7707SDK_URL      = http://www.module.ru/mb7707/NeuroMatrix/boards/mb7707_distrib_x32.zip
  WINPCAP_URL        = https://www.winpcap.org/install/bin/WinPcap_4_1_3.exe
  NMSERVER_URL       = http://www.module.ru/mb7707/NeuroMatrix/nmserver.zip

  
# ARM-NMC MB7707 support :
  EDCLTOOL_URL       = http://www.module.ru/mb7707/edcltool-bin/edcltool-20042015-win32.tgz
  NMC_UTILS_URL      = https://github.com/RC-MODULE/nmc-utils/archive/0.1.1.zip
  SYSROOT_URL        = http://www.module.ru/mb7707/random/matlab-dev/armhf-sdk-sysroot.tgz
  SYSROOT_TAR		 = $(notdir $(basename $(SYSROOT_URL))).tar
  FIRMWARE7707_URL   = http://www.module.ru/mb7707/random/matlab-dev/raspbian-jessie-matlab.tar.gz
  FIRMWARE7707_TAR   = $(notdir $(basename $(FIRMWARE7707_URL)))
  #ARM_TOOLCHAIN_URL = http://www.module.ru/mb7707/toolchains/linaro/windows/arm-linux-gnueabihf-16062016.tgz
  #ARM_TOOLCHAIN_URL = http://www.module.ru/mb7707/toolchains/windows/arm-rcm-linux-gnueabihf-27062016.zip
  #ARM_TOOLCHAIN_URL = http://www.module.ru/mb7707/toolchains/windows/arm-rcm-linux-gnueabihf-03082016.zip
  #ARM_TOOLCHAIN_URL = http://www.module.ru/mb7707/ci/toolchains/raspbian/windows/arm-rcm-linux-gnueabihf-07092016.zip
  ARM_TOOLCHAIN_URL  = http://www.module.ru/mb7707/ci/toolchains/debian-armhf/windows/arm-rcm-linux-gnueabihf-22112016.zip	  
  #ARM_TOOLCHAIN_TAR  = $(notdir $(basename $(ARM_TOOLCHAIN_URL))).tar
  
# x86 Compilers  
  MINGW_URL         = http://win-builds.org/1.5.0/win-builds-1.5.0.exe
# * [Visual Studio 2005 Express](http://apdubey.blogspot.ru/2009/04/microsoft-visual-studio-2005-express.html)
# * [Visual Studio 2013 Express](https://www.microsoft.com/en-US/download/details.aspx?id=44914)    
  
## SCRIPTS:
#  LUA_URL        = http://downloads.sourceforge.net/project/luabinaries/5.2.4/Tools%20Executables/lua-5.2.4_Win32_bin.zip
#  TCL_URL        = http://downloads.activestate.com/ActiveTcl/releases/8.6.4.1/ActiveTcl8.6.4.1.299124-win32-x86_64-threaded.exe
## LINKS:
# * [PUTTY's homepage]           http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
#
## FOR LINUX:
#  MC5103SDK_URL = http://www.module.ru/mb7707/NeuroMatrix/boards/mc5103_distrib_v_01_01.tar.gz
#  MB7707SDK_URL = http://www.module.ru/mb7707/NeuroMatrix/boards/mb7707_distrib_v_01_00.tar.gz
#  NMSDK_URL      = http://www.module.ru/mb7707/toolchains-neuromatrix/nmsdk.tar.gz
  
  

	
all: download install	  

install:  install-nmc  
download: download-nmc   

####################### nmc support ######################################		
PACKAGES_NMC = $(notdir $(NMC_URLS)) 



install-nmc:  install-nmsdk nmcalculator highlighter edcltool-win32 

install-boards:  install-mc5103sdk install-mb7707sdk install-mc7601sdk install-mc12101sdk

boards:  mc5103sdk mb7707sdk mc7601sdk mc12101sdk nmserver

download-nmc: $(PACKAGES_NMC)

#-------------------------------------------------------
test:
	@echo **********
	@echo ** TEST **
	@echo **********

install-nmsdk:  nmsdk 
	setenv -ua NEURO $(realpath .)/nmsdk
	setenv -ua PATH %%NEURO%\bin;
	@echo ***********************************************
	@echo ** Installation Neuro Matrix SDK completed!  **
	@echo ***********************************************

nmsdk: $(notdir $(NMSDK_URL)) $(notdir $(VCREDIST_URL)) $(notdir $(VCREDIST13_URL))
	$(OS_UNZIP) $(<) -d nmsdk
	-$(notdir $(VCREDIST_URL))
	-$(notdir $(VCREDIST13_URL))
	

$(notdir $(NMSDK_URL)):
	$(OS_WGET) $(NMSDK_URL) $(NOPROXY)

$(notdir $(VCREDIST_URL)):
	$(OS_WGET) $(VCREDIST_URL)

$(notdir $(VCREDIST13_URL)):
	$(OS_WGET) $(VCREDIST13_URL)
	
#---------------------------------------------------------------	
nmcalculator: $(notdir $(NMCALC_URL)) 
	$(OS_UNZIP) $(<) 
	
$(notdir $(NMCALC_URL)):
	$(OS_WGET) $(NMCALC_URL) $(NOPROXY)

#---------------------------------------------------------------	
nmserver: $(notdir $(NMSERVER_URL)) 
	$(OS_UNZIP) $(<) 

$(notdir $(NMSERVER_URL)):
	$(OS_WGET) $(NMSERVER_URL) $(NOPROXY)

#---------------------------------------------------------------	
highlighter:  asm-highlighter-master

asm-highlighter-master:
	$(OS_WGET) $(HIGHLIGHTER_URL)
	$(OS_UNZIP) asm-highlighter-master.zip

#---------------------------------------------------------------		
edcltool-win32: $(notdir $(EDCLTOOL_URL))  $(TAR)
	$(OS_GZIP) $(<) 
	$(OS_TAR) edcltool-20042015-win32.tar

$(notdir $(EDCLTOOL_URL)): 
	$(OS_WGET) $(EDCLTOOL_URL) $(NOPROXY)

#----------------------------------------------------------
install-mc5103sdk: mc5103sdk ./nmsdk/bin/mc5103_mon.abs
	setenv -ua MC5103 $(realpath .)/mc5103sdk
	setenv -ua PATH %%MC5103%\bin;
	@echo ***********************************************************
	@echo ** Installation MC5103SDK completed in user space!       **
	@echo ** Install board driver manualy                          **
	@echo ***********************************************************

mc5103sdk: $(notdir $(MC5103SDK_URL)) 
	$(OS_UNZIP) $(<) -d mc5103sdk

./nmsdk/bin/mc5103_mon.abs:
	-mkdir nmsdk & cd nmsdk & mkdir bin
	cp ./mc5103sdk/bin/mc5103_mon.abs ./nmsdk/bin/

$(notdir $(MC5103SDK_URL)):
	$(OS_WGET) $(MC5103SDK_URL) $(NOPROXY)

#----------------------------------------------------------
install-mb7707sdk: mb7707sdk
	setenv -$(USER)a MB7707 $(realpath .)/mb7707sdk
	setenv -$(USER)a MB7707MAC 1A-2B-3C-4D-5E-6F
	setenv -$(USER)a MB7707ETH 1
	setenv -$(USER)a PATH %%MB7707%\bin
	@echo *********************************************
	@echo ** Installation MB7707SDK completed!       **
	@echo ** Install board driver manualy            **
	@echo *********************************************


mb7707sdk: $(notdir $(MB7707SDK_URL)) $(notdir $(WINPCAP_URL))
	$(OS_UNZIP) $(<) -d mb7707sdk
	-$(notdir $(WINPCAP_URL))

$(notdir $(MB7707SDK_URL)): 
	$(OS_WGET) $(MB7707SDK_URL) $(NOPROXY)

$(notdir $(WINPCAP_URL)): 
	$(OS_WGET) $(WINPCAP_URL)

#----------------------------------------------------------
install-mc7601sdk: mc7601sdk
	setenv -ua MC7601 $(realpath .)/mc7601sdk
	setenv -ua MC7601IP 192.168.1.2
	setenv -ua PATH %%MC7601%\bin
	@echo *********************************************
	@echo ** Installation MC7601SDK completed!       **
	@echo *********************************************

mc7601sdk: $(notdir $(MC7601SDK_URL)) 
	$(OS_UNZIP) $(<) -d mc7601sdk 

$(notdir $(MC7601SDK_URL)):
	$(OS_WGET) $(MC7601SDK_URL) $(NOPROXY)

#---------------------------------------------------------
	
install-mc12101sdk: mc12101sdk
	setenv -ua MC12101 $(realpath .)/mc12101sdk
	setenv -ua PATH %%MC12101%\bin
	@echo ***********************************************************
	@echo ** Installation MC12101SDK completed in user space!      **
	@echo ** Install board driver manualy                          **
	@echo ***********************************************************

mc12101sdk: $(notdir $(MC12101SDK_URL)) 
	$(OS_UNZIP) $(<) -d mc12101sdk 

$(notdir $(MC12101SDK_URL)):
	$(OS_WGET) $(MC12101SDK_URL) $(NOPROXY)


#---------------------------------------------------------	
install-vshell32: vshell32
	setenv -$(USER)a VSHELL32 $(realpath .)/vshell32
	setenv -$(USER)a PATH ;%%VSHELL32%\bin

vshell32: $(notdir $(VSHELL32_URL)) 
	$(OS_UNZIP) $(<) 

$(notdir $(VSHELL32_URL)) $(notdir $(VSHELL32_DIST)):
	$(OS_WGET) $(VSHELL32_URL) $(NOPROXY)
	$(OS_WGET) $(VSHELL32_DIST) $(NOPROXY)

#---------------------------------------------------------

################## ARM NMC support ############################################################	
PACKAGES_ARM = $(notdir $(SYSROOT_URL)  $(FIRMWARE7707_URL) $(ARM_TOOLCHAIN_URL)) nmc-utils-0.1.1.zip	

install-arm:  nmc-utils-0.1.1 raspbian-jessie-matlab arm-toolchain

download-arm: $(PACKAGES_ARM)

nmc-utils-0.1.1:  nmc-utils-0.1.1.zip nmsdk 
	$(OS_UNZIP) $(<) 
	$(MAKE) -C nmc-utils-0.1.1/libeasynmc-nmc

nmc-utils-0.1.1.zip:  
	$(OS_WGET) $(NMC_UTILS_URL) 

arm-toolchain: $(notdir $(ARM_TOOLCHAIN_URL)) 
	$(OS_UNZIP) $(<) 

# $(notdir $(SYSROOT_URL))	
#	$(OS_GZIP) $(<)
#	$(OS_TAR) $(ARM_TOOLCHAIN_TAR) 
#	$(OS_GZIP) $(notdir $(SYSROOT_URL))
#	mkdir .\i686-w64-mingw32\arm-linux-gnueabihf\libc
#	$(OS_TAR)  $(SYSROOT_TAR) -C .\i686-w64-mingw32\arm-linux-gnueabihf\libc

$(notdir $(ARM_TOOLCHAIN_URL)):  
	$(OS_WGET) $(ARM_TOOLCHAIN_URL) $(NOPROXY)

$(notdir $(SYSROOT_URL)):  
	$(OS_WGET) $(SYSROOT_URL) $(NOPROXY)

raspbian-jessie-matlab: raspbian-jessie-matlab/.installed

raspbian-jessie-matlab/.installed: $(notdir $(FIRMWARE7707_URL))  
	$(OS_GZIP) $(<)
	$(OS_TAR)  $(FIRMWARE7707_TAR)
	@echo raspbian-jessie-matlab has been installed > $(@)

$(notdir $(FIRMWARE7707_URL)):   
	$(OS_WGET) $(FIRMWARE7707_URL) $(NOPROXY)

############################################

install-lua: lua
	setenv -$(USER)a PATH $(realpath .)/lua
	
lua: $(notdir $(LUA_URL))
	$(OS_UNZIP) $(<) -d lua

$(notdir $(LUA_URL)): 
	$(OS_WGET) $(LUA_URL) 

tcl: $(notdir $(TCL_URL))
	$(OS_UNZIP) $(<) -d lua

$(notdir $(TCL_URL)): 
	$(OS_WGET) $(TCL_URL) 


	
set-neuro: 	
	setenv -$(USER)a NEURO $(realpath .)/nmsdk
	
#	setx NEURO $(realpath .)/nmsdk

set-devkit: 	
	setenv -ua DEVKIT $(realpath .)

#	setx DEVKIT $(realpath .)

path-nmsdk:
	setenv -$(USER)a PATH %%NEURO%\bin;

#	expr length "%path%;%cd%" >.path.len & cat .path.len & set /p len=<.path.len & if %len% LEQ 11024 (setx ppp $(PATH);$(realpath .)) else echo wt

path:
	expr length "%path%;%cd%" >.path.len 
	cat .path.len 
	setx len /f .path.len /a 0,0
	echo %len%
	if 10 leq 1024 	echo ok else echo wtf

#	(setx ppp %NEURO% %len%) else echo wtf

mingw:
	$(OS_WGET) -r --no-parent --no-host-directories http://win-builds.org/1.5.0/packages/
	$(OS_WGET) $(MINGW_URL) 
	ren $(notdir $(MINGW_URL)) win-builds.exe
	win-builds.exe

#################### cleanup ##################################################################################

clean:
	-$(OS_RM) *.zip *.exe *.tgz *.tar *.gz
	-$(OS_RD) arm-rcm-linux-gnueabihf\  mb7707sdk mc5103sdk mc7601sdk mc12101sdk nmsdk nmserver asm-highlighter-master gnuwin32 gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_win32 rootfs nmc-utils-0.1.1 raspbian-jessie-matlab nmcalculator edcltool-win32 lua

clean-nmc:
	-$(OS_RM) $(PACKAGES_NMC)  winpcap
	-$(OS_RD) nmsdk mc5103sdk mb7707sdk mc7601sdk nmcalculator edcltool-win32

clean-gnu:
	-$(OS_RM) $(PACKAGES_GNU) 
	-$(OS_RD) gnuwin32

clean-arm:
	-$(OS_RM) $(PACKAGES_ARM) 
	-$(OS_RD) raspbian-jessie-matlab nmc-utils-0.1.1 i686-w64-mingw32

#	cmd /c copy /B gnuwin32\bin\wget.exe+,, gnuwin32\bin\wget.exe
#	cmd /c copy /B gnuwin32\bin\7za.exe+,, gnuwin32\bin\7za.exe
#download-7zip-wget $(notdir $(ZIP7_URL)) $(notdir $(WGET_BIN_URL)) $(notdir $(WGET_DEP_URL)):
		