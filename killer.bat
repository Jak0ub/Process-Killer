@echo off
:repeat
set /p user=Enter process to search for: 
tasklist | findstr /i %user% >nul
if %errorlevel% equ 0 (goto kill) else (cls & echo Process not found & timeout /nobreak /t 1 >nul & goto repeat)
:kill
cls
echo Process found!
timeout /nobreak /t 1 >nul
set /p oke=Do you want to terminate the process? (1=Yes, other=No): 
if %oke% equ 1 (taskkill /IM %user% -F & taskkill /IM %user%.exe -F & cls) else (echo Exiting & timeout /nobreak /t 3 >nul & exit)
tasklist | findstr /i %user% >nul
if %errorlevel% equ 0 (echo Unable to terminate process & timeout /nobreak /t 5 >nul & exit) else (echo Process terminated successfully & timeout /nobreak /t 5 >nul & exit)
