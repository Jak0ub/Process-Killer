@echo off
:repeat
set /p user=Enter process for search: 
tasklist | findstr /i %user% >nul
if %errorlevel% equ 0 (goto kill)else (cls & echo process not found! & timeout /nobreak /t 1 >nul & goto repeat)
:kill
cls
echo process found!
timeout /nobreak /t 1 >nul
set /p oke=End process?(1=Yes, other=No): 
if %oke% equ 1 (taskkill /IM %user% -F & taskkill /IM %user%.exe -F & cls)else (echo exiting... & timeout /nobreak /t 3 >nul & exit)
timeout /nobreak /t 1 >nul
tasklist | findstr /i %user% >nul
if %errorlevel% equ 0 (echo process wasn't able to be ended & timeout /nobreak /t 5 >nul & exit )else (echo process sucessfully ended & timeout /nobreak /t 5 >nul & exit)
