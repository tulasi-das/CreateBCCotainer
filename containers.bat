@echo off
pushd "%~dp0"

:: Step 1: Find all .mum packages related to Containers
dir /b %SystemRoot%\servicing\Packages\*Containers*.mum >containers.txt

:: Step 2: Add all packages manually using DISM
for /f %%i in ('findstr /i . containers.txt 2^>nul') do (
    echo Installing %%i
    dism /online /norestart /add-package:"%SystemRoot%\servicing\Packages\%%i"
)

:: Step 3: Clean up temporary file
del containers.txt

:: Step 4: Enable the Containers feature
Dism /online /enable-feature /featurename:Containers -All /LimitAccess

pause
