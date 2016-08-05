@set /P x=Do you want to set NEURO = "%~dp0nmsdk" ? (y/n)?
@set x=%x:~0,1%
@rem if (%x%)==(y) call setx NEURO %~dp0nmsdk
@ if (%x%)==(y) setenv -a NEURO %~dp0nmsdk
@pause

