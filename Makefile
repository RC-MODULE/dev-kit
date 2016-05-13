# dev-pack 1.0

#http_proxy ?=http://username:password@proxy:80/
include global.mk

all: get-all install-all

ifeq ($(OS),Windows_NT)
 # RCM Module production packages 
  SDK_MC5103_URL = http://www.module.ru/mb7707/NeuroMatrix/boards/mc5103_distrib_v_01_01_with_printf_non_official.zip
  SDK_MB7707_URL = http://www.module.ru/mb7707/NeuroMatrix/boards/mb7707_distrib_v_01_02_x32.zip
  SDK_MC7601_URL = http://www.module.ru/mb7707/NeuroMatrix/boards/mc7601_distrib_non_official.zip
  NMSDK_URL      = http://www.module.ru/mb7707/toolchains-neuromatrix/nmsdk_2016-04-19_non_official.zip
  NM_IO_URL      = http://www.module.ru/mb7707/NeuroMatrix/nm_io.zip
  VSHELL32_URL   = http://www.module.ru/mb7707/NeuroMatrix/VSHELL32.ZIP
  VSHELL32_DIST  = http://www.module.ru/mb7707/NeuroMatrix/VSHELL32_1.0.0.26.exe
  NMC_UTILS_URL  = https://github.com/RC-MODULE/nmc-utils/archive/0.1.1.zip
  NMCALC_URL     = http://www.module.ru/mb7707/NeuroMatrix/nmcalculator.zip 
  SYSROOT_URL    = http://www.module.ru/mb7707/random/matlab-dev/armhf-sdk-sysroot.tgz
  FIRMWARE7707_URL=http://www.module.ru/mb7707/random/matlab-dev/raspbian-jessie-matlab.tar.gz
  
 # 3rd party production packages 
  COREUTILS_URL	 = http://sourceforge.net/projects/gnuwin32/files/coreutils/5.3.0/coreutils-5.3.0-bin.zip
  COREDEPS_URL	 = http://sourceforge.net/projects/gnuwin32/files/coreutils/5.3.0/coreutils-5.3.0-dep.zip
  DIFFUTILS_URL  = http://downloads.sourceforge.net/project/gnuwin32/diffutils/2.8.7-1/diffutils-2.8.7-1-bin.zip
  DIFFDEPS_URL   = http://downloads.sourceforge.net/project/gnuwin32/diffutils/2.8.7-1/diffutils-2.8.7-1-dep.zip
  FIND_URL       = https://sourceforge.net/projects/gnuwin32/files/findutils/4.2.20-2/findutils-4.2.20-2-bin.zip
  CECHO_URL 	 = https://github.com/elisherer/cecho/archive/master.zip
  PUTTY_URL      = http://tartarus.org/~simon/putty-snapshots/x86/putty.zip
  GNUMAKE_URL	 = http://downloads.sourceforge.net/project/gnuwin32/make/3.81/make-3.81-bin.zip 
  GNUMAKEDEPS_URL= http://downloads.sourceforge.net/project/gnuwin32/make/3.81/make-3.81-dep.zip
  WGETBIN_URL    = http://downloads.sourceforge.net/project/gnuwin32/wget/1.11.4-1/wget-1.11.4-1-bin.zip
  WGETDEP_URL    = http://downloads.sourceforge.net/project/gnuwin32/wget/1.11.4-1/wget-1.11.4-1-dep.zip
  # PUTTY's homepage http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
  
 # archivators (7z+tar) 
  TAR_URL        = http://downloads.sourceforge.net/project/gnuwin32/tar/1.13-1/tar-1.13-1-bin.zip
  TARDEP_URL     = http://downloads.sourceforge.net/project/gnuwin32/tar/1.13-1/tar-1.13-1-dep.zip
  ZIP7_URL       = http://www.7-zip.org/a/7za920.zip

 #gcc-linaro-arm 
#  ARM_TOOLCHAIN_URL    = https://launchpad.net/linaro-toolchain-binaries/trunk/2013.10/+download/gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_win32.zip
  ARM_TOOLCHAIN_URL = http://sysprogs.com/files/gnutoolchains/raspberry/raspberry-gcc4.9.2-r2.exe
  
# * [Visual Studio 2005 Express](http://apdubey.blogspot.ru/2009/04/microsoft-visual-studio-2005-express.html)
# * [Visual Studio 2013 Express](https://www.microsoft.com/en-US/download/details.aspx?id=44914)    
  
  NMC_URLS = \
	  $(SDK_MC5103_URL) \
	  $(SDK_MB7707_URL) \
	  $(SDK_MC7601_URL) \
	  $(NMSDK_URL)      \
	  $(NM_IO_URL)      \
	  $(VSHELL32_URL)   \
	  $(VSHELL32_DIST)  \
	  $(NMCALC_URL)
	  
  GNU_URLS =\
	  $(COREUTILS_URL)	 \
	  $(COREDEPS_URL)	 \
	  $(FIND_URL)       \
	  $(CECHO_URL) 	 \
	  $(GNUMAKE_URL) \
	  $(GNUMAKEDEPS_URL) \
	  $(DIFFUTILS_URL) \
	  $(WGETBIN_URL) \
	  $(WGETDEP_URL) 
	  
	  
  
  ARM_URLS = \
	  $(SYSROOT_URL) \
	  $(NMC_UTILS_URL) \
	  $(PUTTY_URL)	  \
	  $(FIRMWARE7707_URL) \
	  $(ARM_TOOLCHAIN_URL) 
	  
  ARC_URLS = \
      $(TAR_URL) \
      $(TARDEP_URL) \
      $(ZIP7_URL) 
      
else
  SDK_MC5103_URL = http://www.module.ru/mb7707/NeuroMatrix/boards/mc5103_distrib_v_01_01.tar.gz
  SDK_MB7707_URL = http://www.module.ru/mb7707/NeuroMatrix/boards/mb7707_distrib_v_01_00.tar.gz
  NMSDK_URL      = http://www.module.ru/mb7707/toolchains-neuromatrix/nmsdk.tar.gz
  NM_IO_URL      = http://www.module.ru/mb7707/NeuroMatrix/nm_io.zip
  
  NMC_URLS = \
	  $(SDK_MC5103_URL) \
	  $(SDK_MB7707_URL) \
	  $(NMSDK_URL)      \
	  $(NM_IO_URL)      
	
endif
	
PACKAGES_NMC = $(notdir $(NMC_URLS))
PACKAGES_ARM = $(notdir $(ARM_URLS)) 
PACKAGES_GNU = $(notdir $(GNU_URLS))
PACKAGES_ARC = $(notdir $(ARC_URLS))

PACKAGES_GNU:= $(subst master.zip,cecho.zip,$(PACKAGES_GNU))
#PACKAGES_ARM:= $(subst master.zip,nmc-utils.zip,$(PACKAGES_ARM))

.PHONY = arm-toolchain install-arc

install-nmc: nmsdk nm_io mc5103sdk mb7707sdk mc7601sdk vshell32 nmcalculator

install-arm: rootfs nmc-utils-0.1.1 raspbian-jessie-matlab arm-toolchain

install-gnu: gnuwin32/bin/.gnu_installed gnumake
	
install-arc: gnuwin32/bin/.arc_installed

install-all: get-all install-nmc install-gnu install-arc install-arm

#------------------------- package downloading of depended URLs --------------------

get-all:
	$(OS_WGET) $(NMC_URLS) $(ARM_URLS) $(ARC_URLS) $(GNU_URLS)
	-ren master.zip cecho.zip	
	
get-nmc: $(PACKAGES_NMC)

$(PACKAGES_NMC):
	$(OS_WGET) $(NMC_URLS)
	
#.....................................................
get-arm: $(PACKAGES_ARM)

$(PACKAGES_ARM): 
	$(OS_WGET) $(ARM_URLS)

#.....................................................
get-gnu: 	$(PACKAGES_GNU) $(PACKAGES_ARC)

$(PACKAGES_GNU): 
	$(OS_WGET) $(GNU_URLS) $(ARC_URLS)
	-ren master.zip cecho.zip	

#.....................................................
get-arc: 	$(PACKAGES_ARC)

$(PACKAGES_ARC): 
	$(OS_WGET) $(ARC_URLS)

#------------------------- package installation  --------------------

mc5103sdk: $(notdir $(SDK_MC5103_URL))
	-mkdir $(@)
	$(OS_UNPACK) $(<) $(OS_TODIR) $(@)
	
mb7707sdk: $(notdir $(SDK_MB7707_URL))
	-mkdir $(@)
	$(OS_UNPACK) $(<) $(OS_TODIR) $(@) 

mc7601sdk: $(notdir $(SDK_MC7601_URL))
	-mkdir $(@)
	$(OS_UNPACK) $(<) $(OS_TODIR) $(@) 

nmsdk: $(notdir $(NMSDK_URL))
	-mkdir $(@)
	$(OS_UNPACK) $(<) $(OS_TODIR) $(@)

vshell32: $(notdir $(VSHELL32_URL))
	$(OS_UNPACK) $(<) 

nm_io: $(notdir $(NM_IO_URL))
	$(OS_UNPACK) $(<)

nmcalculator: $(notdir $(NMCALC_URL))
	$(OS_UNPACK) $(<)
	
gnuwin32/bin/.gnu_installed: $(notdir $(COREUTILS_URL)) putty.zip $(notdir $(DIFFUTILS_URL)) 
	-mkdir gnuwin32
	-mkdir gnuwin32\bin
	$(OS_UNPACK) $(notdir $(WGETBIN_URL))   $(OS_TODIR) gnuwin32
	$(OS_UNPACK) $(notdir $(WGETDEP_URL))   $(OS_TODIR) gnuwin32
	$(OS_UNPACK) $(notdir $(COREUTILS_URL)) $(OS_TODIR) gnuwin32
	$(OS_UNPACK) $(notdir $(COREDEPS_URL))  $(OS_TODIR) gnuwin32
	$(OS_UNPACK) $(notdir $(FIND_URL))      $(OS_TODIR) gnuwin32
	$(OS_UNPACK) $(notdir $(DIFFUTILS_URL)) $(OS_TODIR) gnuwin32
	$(OS_UNPACK) $(notdir $(PUTTY_URL))     $(OS_TODIR) gnuwin32\bin
	$(OS_UNPACK) cecho.zip                  $(OS_TODIR) gnuwin32
	-copy .\gnuwin32\cecho-master\cecho\bin\Release\cecho.exe .\gnuwin32\bin
	@echo GNU utils have been installed >> $(@)

gnuwin32/bin/.arc_installed: $(PACKAGES_ARC) 
	-mkdir gnuwin32
	-mkdir gnuwin32\bin
	$(OS_UNPACK) $(notdir $(ZIP7_URL))   $(OS_TODIR) gnuwin32\bin
	$(OS_UNPACK) $(notdir $(TAR_URL))  	 $(OS_TODIR) gnuwin32
	$(OS_UNPACK) $(notdir $(TARDEP_URL)) $(OS_TODIR) gnuwin32
	@echo "tar & 7z has been installed" > $(@)

gnumake: make-3.81-bin.zip make-3.81-dep.zip 
	-mkdir gnumake
	$(OS_UNPACK) make-3.81-bin.zip    $(OS_TODIR) gnumake
	$(OS_UNPACK) make-3.81-dep.zip    $(OS_TODIR) gnumake
	
rootfs: rootfs/.installed

rootfs/.installed: $(notdir $(SYSROOT_URL))  gnuwin32/bin/.arc_installed
	-mkdir rootfs
	7za e $(notdir $(SYSROOT_URL)) -y
	tar -vxf armhf-sdk-sysroot.tar -C rootfs
	@echo rootfs has been installed > $(@)
	
nmc-utils-0.1.1: 0.1.1.zip gnuwin32/bin/.arc_installed
	7za x $(<) 

arm-toolchain: $(notdir $(ARM_TOOLCHAIN_URL))
	@echo **************************************************************************************************************
	@echo ** Install raspberry-gcc4.9.2-r2.exe manualy. It is recommended to install it to default path               **
	@echo **************************************************************************************************************

#gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_win32: $(notdir $(ARM_TOOLCHAIN_URL)) gnuwin32/bin/.arc_installed
#	$(GNUWIN32)/7za x $(<) -y

raspbian-jessie-matlab: raspbian-jessie-matlab/.installed

raspbian-jessie-matlab/.installed: $(notdir $(FIRMWARE7707_URL)) gnuwin32/bin/.arc_installed
	7za e $(<)	-y
	tar -vxf raspbian-jessie-matlab.tar
	@echo raspbian-jessie-matlab has been installed > $(@)
	
	
	
#------------------------------------------------------------------------------------	
clean:
	-$(OS_RM) *.zip *.exe *.tgz *.tar *.gz
	-$(OS_RD) mb7707sdk mc5103sdk mc7601sdk nmsdk vshell32 gnuwin32 nm_io gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_win32 rootfs nmc-utils-0.1.1 raspbian-jessie-matlab nmcalculator

#a: 
#	powershell  -ExecutionPolicy Bypass -file wget2.ps1	https://github.com/RC-MODULE/nmc-utils/archive/0.1.1.zip
#
#test:	
#	powershell  -ExecutionPolicy Bypass -file test.ps1
#  http://www.7-zip.org/a/7za920.zip	