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
#export  https_proxy=http://login:pass@proxyserver:port

SHELL    = cmd
OS_RM    = del /Q
OS_RD    = rd /Q /S 
OS_WGET  = wget -nc --no-check-certificate --content-disposition 
export PATH := $(realpath ./gnuwin32/bin);$(PATH);


## SDK/LIBRARIES/TOOLS/TOOLCHAINS:
  NMSDK_URL          = http://www.module.ru/mb7707/toolchains-neuromatrix/nmsdk_2016-04-19_non_official.zip
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
  FIRMWARE7707_URL   = http://www.module.ru/mb7707/random/matlab-dev/raspbian-jessie-matlab.tar.gz
  ARM_TOOLCHAIN_URL  = http://sysprogs.com/files/gnutoolchains/raspberry/raspberry-gcc4.9.2-r2.exe
 
## UTILITIES:
  COREUTILS_BIN_URL	 = http://sourceforge.net/projects/gnuwin32/files/coreutils/5.3.0/coreutils-5.3.0-bin.zip
  COREUTILS_DEP_URL	 = http://sourceforge.net/projects/gnuwin32/files/coreutils/5.3.0/coreutils-5.3.0-dep.zip
  DIFFUTILS_BIN_URL  = http://downloads.sourceforge.net/project/gnuwin32/diffutils/2.8.7-1/diffutils-2.8.7-1-bin.zip
  DIFFUTILS_DEP_URL  = http://downloads.sourceforge.net/project/gnuwin32/diffutils/2.8.7-1/diffutils-2.8.7-1-dep.zip
  FIND_URL           = https://sourceforge.net/projects/gnuwin32/files/findutils/4.2.20-2/findutils-4.2.20-2-bin.zip
  GREP_BIN_URL       = http://downloads.sourceforge.net/project/gnuwin32/grep/2.5.4/grep-2.5.4-bin.zip
  GREP_DEP_URL       = http://downloads.sourceforge.net/project/gnuwin32/grep/2.5.4/grep-2.5.4-dep.zip
  PUTTY_URL          = http://tartarus.org/~simon/putty-snapshots/x86/putty.zip
  GNUMAKE_BIN_URL    = http://downloads.sourceforge.net/project/gnuwin32/make/3.81/make-3.81-bin.zip 
  GNUMAKE_DEP_URL    = http://downloads.sourceforge.net/project/gnuwin32/make/3.81/make-3.81-dep.zip
  WGET_BIN_URL       = http://downloads.sourceforge.net/project/gnuwin32/wget/1.11.4-1/wget-1.11.4-1-bin.zip
  WGET_DEP_URL       = http://downloads.sourceforge.net/project/gnuwin32/wget/1.11.4-1/wget-1.11.4-1-dep.zip
  TAR_BIN_URL        = http://downloads.sourceforge.net/project/gnuwin32/tar/1.13-1/tar-1.13-1-bin.zip
  TAR_DEP_URL        = http://downloads.sourceforge.net/project/gnuwin32/tar/1.13-1/tar-1.13-1-dep.zip
  CECHO_URL 	     = https://github.com/elisherer/cecho/archive/master.zip
  
  ZIP7_URL           = http://www.7-zip.org/a/7za920.zip

  
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
	$(NM_IO_URL)      \
	$(VSHELL32_URL)   \
	$(VSHELL32_DIST)  \
	$(NMCALC_URL)     \
	$(SDK_MC5103_URL) \
	$(SDK_MC7601_URL) \
	$(SDK_MB7707_URL) \
	$(EDCLTOOL_URL)   \
	$(WINPCAP_URL)
	
	  
GNU_URLS =\
	$(COREUTILS_BIN_URL)	 \
	$(COREUTILS_DEP_URL)	 \
	$(DIFFUTILS_BIN_URL) \
	$(FIND_URL)       \
	$(PUTTY_URL)	  \
	$(GNUMAKE_BIN_URL) \
	$(GNUMAKE_DEP_URL) \
	$(GREP_BIN_URL) \
	$(GREP_DEP_URL) \
	$(TAR_BIN_URL) \
	$(TAR_DEP_URL) \
	$(WGET_BIN_URL) \
	$(WGET_DEP_URL) 

#   $(CECHO_URL) 	 separate url because of master.zip


	



install:  install-nmc install-gnu install-arm
download: download-nmc  download-gnu download-arm

####################### 7zip & wget installation ######################################	

$(eval OUT=$(shell  wget ))
ifneq ($(OUT),)
FIRST_WGET:= wget -nc --no-check-certificate --content-disposition 
else 
FIRST_WGET:= powershell  -ExecutionPolicy Bypass -file wget.ps1
endif


7ZIP = gnuwin32/bin/7za.exe
WGET = gnuwin32/bin/wget.exe
TAR  = gnuwin32/bin/tar.exe
GNUWIN32 = gnuwin32/bin/.gnu_installed  

install-7zip-wget: $(WGET)

$(7ZIP) $(WGET): 
	-@mkdir gnuwin32
	-@mkdir gnuwin32\bin
	$(FIRST_WGET)  $(ZIP7_URL) $(WGET_BIN_URL) $(WGET_DEP_URL) 
	powershell  -ExecutionPolicy Bypass -file unzip.ps1 $(notdir $(WGET_BIN_URL)) -d gnuwin32
	powershell  -ExecutionPolicy Bypass -file unzip.ps1 $(notdir $(WGET_DEP_URL)) -d gnuwin32
	powershell  -ExecutionPolicy Bypass -file unzip.ps1 $(notdir $(ZIP7_URL))     -d gnuwin32\bin

####################### nmc support ######################################		
PACKAGES_NMC = $(notdir $(NMC_URLS)) 


install-nmc:  $(7ZIP) nmsdk nm_io mc5103sdk mb7707sdk mc7601sdk vshell32 nmcalculator edcltool-win32 winpcap
	
download-nmc: $(WGET) $(PACKAGES_NMC)
	
mc5103sdk: $(notdir $(SDK_MC5103_URL)) $(7ZIP)
	7za x $(<) -y -o$(@)

$(notdir $(SDK_MC5103_URL)):
	$(OS_WGET) $(SDK_MC5103_URL)
	
mb7707sdk: $(notdir $(SDK_MB7707_URL)) $(7ZIP)
	7za x $(<) -y -o$(@) 

$(notdir $(SDK_MB7707_URL)): $(WGET)
	$(OS_WGET) $(SDK_MB7707_URL)
	
mc7601sdk: $(notdir $(SDK_MC7601_URL)) $(7ZIP)
	7za x $(<) -y -o$(@) 

$(notdir $(SDK_MC7601_URL)):
	$(OS_WGET) $(SDK_MC7601_URL)
	
nmsdk: $(notdir $(NMSDK_URL)) $(7ZIP)
	7za x $(<) -y -o$(@)

$(notdir $(NMSDK_URL)):
	$(OS_WGET) $(NMSDK_URL)
	
vshell32: $(notdir $(VSHELL32_URL)) $(7ZIP)
	7za x $(<) -y
	
$(notdir $(VSHELL32_URL)) $(notdir $(VSHELL32_DIST)):
	$(OS_WGET) $(VSHELL32_URL)
	$(OS_WGET) $(VSHELL32_DIST)
	

nm_io: $(notdir $(NM_IO_URL)) $(7ZIP)
	7za x $(<) -y

$(notdir $(NM_IO_URL)):
	$(OS_WGET) $(NM_IO_URL)
	
nmcalculator: $(notdir $(NMCALC_URL)) $(7ZIP)
	7za x $(<) -y
	
$(notdir $(NMCALC_URL)):
	$(OS_WGET) $(NMCALC_URL)
	
edcltool-win32: $(notdir $(EDCLTOOL_URL)) $(7ZIP) $(TAR)
	7za x $(<) -y
	tar -vxf edcltool-20042015-win32.tar

winpcap: $(notdir $(WINPCAP_URL))
	@echo *******************************************
	@echo ** Install WinPcap manualy.              **
	@echo *******************************************
	
$(notdir $(WINPCAP_URL)):
	$(OS_WGET) $(WINPCAP_URL)
	
$(notdir $(EDCLTOOL_URL)): 
	$(OS_WGET) $(EDCLTOOL_URL)



##################### gnuwin32 #########################################################
PACKAGES_GNU = $(notdir $(GNU_URLS))

install-gnu:  $(GNUWIN32)

download-gnu: $(WGET) $(PACKAGES_GNU) cecho-master.zip
	
$(GNUWIN32): $(TAR) $(PACKAGES_GNU) gnumake cecho-master.zip  
	7za x $(notdir $(COREUTILS_BIN_URL)) -y -ognuwin32 
	7za x $(notdir $(COREUTILS_DEP_URL)) -y -ognuwin32
	7za x $(notdir $(FIND_URL))          -y -ognuwin32
	7za x $(notdir $(GREP_BIN_URL))      -y -ognuwin32
	7za x $(notdir $(GREP_DEP_URL))   	 -y -ognuwin32
	7za x $(notdir $(DIFFUTILS_BIN_URL)) -y -ognuwin32
	7za x $(notdir $(PUTTY_URL))         -y -ognuwin32\bin
	7za e cecho-master.zip cecho-master\cecho\bin\Release\cecho.exe  -y -ognuwin32\bin
	@echo GNU utils have been installed >> $(@)

$(TAR): 
	$(OS_WGET) $(TAR_BIN_URL) $(TAR_DEP_URL)
	7za x $(notdir $(TAR_BIN_URL))       -y -ognuwin32
	7za x $(notdir $(TAR_DEP_URL))   	 -y -ognuwin32
	
cecho-master.zip: 
	$(OS_WGET) $(CECHO_URL)

gnumake:  $(7ZIP) $(notdir $(GNUMAKE_BIN_URL))  $(notdir $(GNUMAKE_DEP_URL)) 
	7za x $(notdir $(GNUMAKE_BIN_URL)) -y -ognumake
	7za x $(notdir $(GNUMAKE_DEP_URL)) -y -ognumake

$(PACKAGES_GNU): 
	$(OS_WGET) $(GNU_URLS)
	
	
################## ARM NMC support ############################################################	
PACKAGES_ARM = $(notdir $(SYSROOT_URL)  $(FIRMWARE7707_URL) $(ARM_TOOLCHAIN_URL)) nmc-utils-0.1.1.zip	

install-arm:  rootfs nmc-utils-0.1.1 raspbian-jessie-matlab arm-toolchain

download-arm: $(PACKAGES_ARM)

rootfs: rootfs/.installed

rootfs/.installed: $(notdir $(SYSROOT_URL)) $(7ZIP) $(GNUWIN32)
	-mkdir rootfs
	7za e $(notdir $(SYSROOT_URL)) -y
	tar -vxf armhf-sdk-sysroot.tar -C rootfs
	@echo rootfs has been installed > $(@)
	
$(notdir $(SYSROOT_URL)): $(WGET)
	$(OS_WGET) $(SYSROOT_URL)
	
nmc-utils-0.1.1:  nmc-utils-0.1.1.zip nmsdk $(7ZIP)
	7za x $(<) -y
	$(MAKE) -C nmc-utils-0.1.1/libeasynmc-nmc

nmc-utils-0.1.1.zip: $(WGET) 
	$(OS_WGET) $(NMC_UTILS_URL)
	
arm-toolchain: $(notdir $(ARM_TOOLCHAIN_URL))
	@echo ************************************************************************************************
	@echo ** Install raspberry-gcc4.9.2-r2.exe manualy. It is recommended to install it to default path **
	@echo ** It is strongly recommended to delete make.exe from Raspberry/bin folder because of its     **
	@echo ** mulfuction in 3.82 version. Use 3.81 version to process Makefiles     instead              **
	@echo ************************************************************************************************

$(notdir $(ARM_TOOLCHAIN_URL)): $(WGET) 
	$(OS_WGET) $(ARM_TOOLCHAIN_URL)
	
raspbian-jessie-matlab: raspbian-jessie-matlab/.installed

raspbian-jessie-matlab/.installed: $(notdir $(FIRMWARE7707_URL)) $(7ZIP) $(GNUWIN32)
	7za e $(<)	-y
	tar -vxf raspbian-jessie-matlab.tar
	@echo raspbian-jessie-matlab has been installed > $(@)

$(notdir $(FIRMWARE7707_URL)): $(WGET)  
	$(OS_WGET) $(FIRMWARE7707_URL)

 	

#################### cleanup ##################################################################################

clean:
	-$(OS_RM) *.zip *.exe *.tgz *.tar *.gz
	-$(OS_RD) mb7707sdk mc5103sdk mc7601sdk nmsdk vshell32 gnuwin32 nm_io gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_win32 rootfs nmc-utils-0.1.1 raspbian-jessie-matlab nmcalculator

clean-nmc:
	-$(OS_RM) $(PACKAGES_NMC)  winpcap
	-$(OS_RD) nmsdk nm_io mc5103sdk mb7707sdk mc7601sdk vshell32 nmcalculator edcltool-win32
	
clean-gnu:
	-$(OS_RM) $(PACKAGES_GNU) 
	-$(OS_RD) gnuwin32

clean-arm:
	-$(OS_RM) $(PACKAGES_ARM) 
	-$(OS_RD) raspbian-jessie-matlab nmc-utils-0.1.1 rootfs
	
#	cmd /c copy /B gnuwin32\bin\wget.exe+,, gnuwin32\bin\wget.exe
#	cmd /c copy /B gnuwin32\bin\7za.exe+,, gnuwin32\bin\7za.exe
#download-7zip-wget $(notdir $(ZIP7_URL)) $(notdir $(WGET_BIN_URL)) $(notdir $(WGET_DEP_URL)):
		