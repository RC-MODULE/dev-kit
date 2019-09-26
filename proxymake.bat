@echo off
ping proton -n 1 > proxy.test
if  %ERRORLEVEL%==0 set bypass_rcm_proxy=--no-proxy
echo %bypass_rcm_proxy%
rem choice /M "Do you have proxy server?"
rem if errorlevel 2 goto start 

echo Proxy Authentification...
set /p login="Enter Username: "
set "psCommand=powershell -Command "$pword = read-host 'Enter Password' -AsSecureString ; ^
    $BSTR=[System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($pword); ^
        [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)""
for /f "usebackq delims=" %%p in (`%psCommand%`) do set password=%%p
set /p proxy="Enter proxy-server: "
set /p port="Enter proxy-port: "
set  http_proxy=http://%login%:%password%@%proxy%:%port%
set https_proxy=https://%login%:%password%@%proxy%:%port%

:start


echo on
make %1 NOPROXY=%bypass_rcm_proxy% 