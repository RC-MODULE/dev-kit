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

-include proxy.mk
#define proxy setting if required in proxy.mk like:
#export  https_proxy=http://login:pass@proxyserver:port
#export  http_proxy =http://login:pass@proxyserver:port

SHELL    = cmd
OS_RM    = del /Q
OS_RD    = rd /Q /S 
OS_WGET  = wget -nc --no-check-certificate --content-disposition 
OS_UNZIP = unzip -u -o -q 
OS_GZIP  = gzip -d -f -k -v
OS_TAR   = tar -xf

export NEURO = $(realpath ./nmsdk)
export PATH := $(NEURO)/bin;$(PATH);

## SDK/LIBRARIES/TOOLS/TOOLCHAINS:
  NMSDK_URL          = http://www.module.ru/mb7707/toolchains-neuromatrix/nmsdk_2016-04-19_non_official.zip
  VCREDIST_URL       = https://download.microsoft.com/download/e/1/c/e1c773de-73ba-494a-a5ba-f24906ecf088/vcredist_x86.exe
  VSHELL32_URL       = http://www.module.ru/mb7707/NeuroMatrix/VSHELL32.ZIP
  VSHELL32_DIST      = http://www.module.ru/mb7707/NeuroMatrix/VSHELL32_1.0.0.26.exe
  NMCALC_URL         = http://www.module.ru/mb7707/NeuroMatrix/nmcalculator.zip 
  NM_IO_URL          = http://www.module.ru/mb7707/NeuroMatrix/nm_io.zip
  # Pure NMC Board support:
  SDK_MC5103_URL     = http://www.module.ru/mb7707/NeuroMatrix/boards/mc5103_distrib_v_01_01_with_printf_non_official.zip
  SDK_MC7601_URL     = http://www.module.ru/mb7707/NeuroMatrix/boards/mc7601_distrib_non_official.zip
  SDK_MB7707_URL     = http://www.module.ru/mb7707/NeuroMatrix/boards/mb7707_distrib_v_01_02_x32.zip
  WINPCAP_URL        = https://www.winpcap.org/install/bin/WinPcap_4_1_3.exe
  # ARM-NMC MB7707 support :
  EDCLTOOL_URL       = http://www.module.ru/mb7707/edcltool-bin/edcltool-20042015-win32.tgz
  NMC_UTILS_URL      = https://github.com/RC-MODULE/nmc-utils/archive/0.1.1.zip
  SYSROOT_URL        = http://www.module.ru/mb7707/random/matlab-dev/armhf-sdk-sysroot.tgz
  SYSROOT_TAR		 = $(notdir $(basename $(SYSROOT_URL))).tar
  FIRMWARE7707_URL   = http://www.module.ru/mb7707/random/matlab-dev/raspbian-jessie-matlab.tar.gz
  FIRMWARE7707_TAR   = $(notdir $(basename $(FIRMWARE7707_URL)))
  #ARM_TOOLCHAIN_URL  = http://www.module.ru/mb7707/toolchains/linaro/windows/arm-linux-gnueabihf-16062016.tgz
  ARM_TOOLCHAIN_URL  = http://www.module.ru/mb7707/toolchains/windows/arm-rcm-linux-gnueabihf-27062016.zip
  
  ARM_TOOLCHAIN_TAR  = $(notdir $(basename $(ARM_TOOLCHAIN_URL))).tar

## SCRIPTS:
  LUA_URL        = http://downloads.sourceforge.net/project/luabinaries/5.2.4/Tools%20Executables/lua-5.2.4_Win32_bin.zip

## LINKS:
# * [PUTTY's homepage]           http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
# * [Visual Studio 2005 Express](http://apdubey.blogspot.ru/2009/04/microsoft-visual-studio-2005-express.html)
# * [Visual Studio 2013 Express](https://www.microsoft.com/en-US/download/details.aspx?id=44914)    
#
## FOR LINUX:
#  SDK_MC5103_URL = http://www.module.ru/mb7707/NeuroMatrix/boards/mc5103_distrib_v_01_01.tar.gz
#  SDK_MB7707_URL = http://www.module.ru/mb7707/NeuroMatrix/boards/mb7707_distrib_v_01_00.tar.gz
#  NMSDK_URL      = http://www.module.ru/mb7707/toolchains-neuromatrix/nmsdk.tar.gz
#  NM_IO_URL      = http://www.module.ru/mb7707/NeuroMatrix/nm_io.zip
  
NMC_URLS = \
	$(NMSDK_URL)      \
	$(VCREDIST_URL)	  \
	$(NM_IO_URL)      \
	$(VSHELL32_URL)   \
	$(VSHELL32_DIST)  \
	$(NMCALC_URL)     \
	$(SDK_MC5103_URL) \
	$(SDK_MC7601_URL) \
	$(SDK_MB7707_URL) \
	$(EDCLTOOL_URL)   \
	$(WINPCAP_URL)
	
	  

install:  install-nmc  install-arm
download: download-nmc   download-arm

####################### nmc support ######################################		
PACKAGES_NMC = $(notdir $(NMC_URLS)) 


install-nmc:  nmsdk nm_io mc5103sdk mb7707sdk mc7601sdk vshell32 nmcalculator edcltool-win32 winpcap
	
download-nmc: $(PACKAGES_NMC)

$(notdir $(VCREDIST_URL)):
	$(OS_WGET) $(VCREDIST_URL)
	
mc5103sdk: $(notdir $(SDK_MC5103_URL)) 
	$(OS_UNZIP) $(<) -d $(@)

$(notdir $(SDK_MC5103_URL)):
	$(OS_WGET) $(SDK_MC5103_URL)
	
mb7707sdk: $(notdir $(SDK_MB7707_URL)) 
	$(OS_UNZIP) $(<) -d $(@) 

$(notdir $(SDK_MB7707_URL)): 
	$(OS_WGET) $(SDK_MB7707_URL)
	
mc7601sdk: $(notdir $(SDK_MC7601_URL)) 
	$(OS_UNZIP) $(<) -d $(@) 

$(notdir $(SDK_MC7601_URL)):
	$(OS_WGET) $(SDK_MC7601_URL)
	
nmsdk: $(notdir $(NMSDK_URL)) 
	$(OS_UNZIP) $(<) -d $(@)

$(notdir $(NMSDK_URL)):
	$(OS_WGET) $(NMSDK_URL)
	
vshell32: $(notdir $(VSHELL32_URL)) 
	$(OS_UNZIP) $(<) 
	
$(notdir $(VSHELL32_URL)) $(notdir $(VSHELL32_DIST)):
	$(OS_WGET) $(VSHELL32_URL)
	$(OS_WGET) $(VSHELL32_DIST)
	

nm_io: $(notdir $(NM_IO_URL)) 
	$(OS_UNZIP) $(<) 

$(notdir $(NM_IO_URL)):
	$(OS_WGET) $(NM_IO_URL)
	
nmcalculator: $(notdir $(NMCALC_URL)) 
	$(OS_UNZIP) $(<) 
	
$(notdir $(NMCALC_URL)):
	$(OS_WGET) $(NMCALC_URL)
	
edcltool-win32: $(notdir $(EDCLTOOL_URL))  $(TAR)
	$(OS_GZIP) $(<) 
	$(OS_TAR) edcltool-20042015-win32.tar

winpcap: $(notdir $(WINPCAP_URL))
	@echo *******************************************
	@echo ** Install WinPcap manualy.              **
	@echo *******************************************
	
$(notdir $(WINPCAP_URL)):
	$(OS_WGET) $(WINPCAP_URL)
	
$(notdir $(EDCLTOOL_URL)): 
	$(OS_WGET) $(EDCLTOOL_URL)



################## ARM NMC support ############################################################	
PACKAGES_ARM = $(notdir $(SYSROOT_URL)  $(FIRMWARE7707_URL) $(ARM_TOOLCHAIN_URL)) nmc-utils-0.1.1.zip	

install-arm:  nmc-utils-0.1.1 raspbian-jessie-matlab arm-toolchain

download-arm: $(PACKAGES_ARM)

nmc-utils-0.1.1:  nmc-utils-0.1.1.zip nmsdk 
	$(OS_UNZIP) $(<) 
	$(MAKE) -C nmc-utils-0.1.1/libeasynmc-nmc

nmc-utils-0.1.1.zip:  
	$(OS_WGET) $(NMC_UTILS_URL)
	
arm-toolchain: $(notdir $(ARM_TOOLCHAIN_URL)) $(notdir $(SYSROOT_URL))
	$(OS_GZIP) $(<)
	$(OS_TAR) $(ARM_TOOLCHAIN_TAR) 
	$(OS_GZIP) $(notdir $(SYSROOT_URL))
	mkdir .\i686-w64-mingw32\arm-linux-gnueabihf\libc
	$(OS_TAR)  $(SYSROOT_TAR) -C .\i686-w64-mingw32\arm-linux-gnueabihf\libc
	
$(notdir $(ARM_TOOLCHAIN_URL)):  
	$(OS_WGET) $(ARM_TOOLCHAIN_URL)
	
$(notdir $(SYSROOT_URL)):  
	$(OS_WGET) $(SYSROOT_URL)
	
raspbian-jessie-matlab: raspbian-jessie-matlab/.installed

raspbian-jessie-matlab/.installed: $(notdir $(FIRMWARE7707_URL))  
	$(OS_GZIP) $(<)
	$(OS_TAR)  $(FIRMWARE7707_TAR)
	@echo raspbian-jessie-matlab has been installed > $(@)

$(notdir $(FIRMWARE7707_URL)):   
	$(OS_WGET) $(FIRMWARE7707_URL)
	
############################################

lua: $(notdir $(LUA_URL))
	$(OS_UNZIP) $(<) -d lua
		
$(notdir $(LUA_URL)): 
	$(OS_WGET) $(LUA_URL) 

set-neuro: 	
	setenv -a NEURO $(realpath .)/nmsdk
	
#	setx NEURO $(realpath .)/nmsdk

set-devpack: 	
	setenv -a DEVPACK $(realpath .)
	
#	setx DEVPACK $(realpath .)

path-nmsdk:
	setenv -a PATH %%NEURO%\bin;
	
#	expr length "%path%;%cd%" >.path.len & cat .path.len & set /p len=<.path.len & if %len% LEQ 11024 (setx ppp $(PATH);$(realpath .)) else echo wt

path:
	expr length "%path%;%cd%" >.path.len 
	cat .path.len 
	setx len /f .path.len /a 0,0
	echo %len%
	if 10 leq 1024 	echo ok else echo wtf
	
#	(setx ppp %NEURO% %len%) else echo wtf
	
	
#################### cleanup ##################################################################################

clean:
	-$(OS_RM) *.zip *.exe *.tgz *.tar *.gz
	-$(OS_RD) mb7707sdk mc5103sdk mc7601sdk nmsdk vshell32 gnuwin32 nm_io gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_win32 rootfs nmc-utils-0.1.1 raspbian-jessie-matlab nmcalculator edcltool-win32 lua

clean-nmc:
	-$(OS_RM) $(PACKAGES_NMC)  winpcap
	-$(OS_RD) nmsdk nm_io mc5103sdk mb7707sdk mc7601sdk vshell32 nmcalculator edcltool-win32
	
clean-gnu:
	-$(OS_RM) $(PACKAGES_GNU) 
	-$(OS_RD) gnuwin32

clean-arm:
	-$(OS_RM) $(PACKAGES_ARM) 
	-$(OS_RD) raspbian-jessie-matlab nmc-utils-0.1.1 i686-w64-mingw32
	
#	cmd /c copy /B gnuwin32\bin\wget.exe+,, gnuwin32\bin\wget.exe
#	cmd /c copy /B gnuwin32\bin\7za.exe+,, gnuwin32\bin\7za.exe
#download-7zip-wget $(notdir $(ZIP7_URL)) $(notdir $(WGET_BIN_URL)) $(notdir $(WGET_DEP_URL)):
		