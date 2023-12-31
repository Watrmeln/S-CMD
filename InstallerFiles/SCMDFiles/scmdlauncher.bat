@echo off
title S-CMD Launcher Build 2
taskkill /IM explorer.exe /F

:menu
color 0A
cls
echo           :-=+++++++=-:           
echo        :=+++++++++++++++=:        
echo      .+++++++-:::::-+++++++.      
echo     :++++++-         -++++++-     
echo    .+++++++-          +++++++:    
echo    ++++++++++-:..     ++++++++    
echo    +++++++++++++++++=-++++++++.   
echo    ++++++++ ..:--=++++++++++++    
echo    -+++++++         .=+++++++=    
echo     +++++++:         .+++++++     
echo      =++++++-.      .=+++++=      
echo       :+++++++++==++++++++:       
echo         .-+++++++++++++-.         
echo             .:-----:.
echo -------------------------------------------0
echo S-CMD LAUNCHER         BUILD 2 - AUG 15 2023
echo -------------------------------------------0
echo.
echo Welcome to the S-CMD Launcher! What would you like to do?
echo -------------------------------------------0
echo 1. Launch explorer (default windows shell)
echo 2. Launch into CMD (Command Prompt)
echo 3. Restart launcher with admin (Allows running CMD as administrator)
echo 4. Power options
set /p CHOICE="Pick the number corresponding to your choice and press ENTER: "

IF %CHOICE%==1 GOTO explorer
IF %CHOICE%==2 GOTO cmd
IF %CHOICE%==3 GOTO cmda
IF %CHOICE%==4 GOTO power
ELSE GOTO invalid

:invalid
color C
cls
echo Your Choice was Invalid. Please choose between the options above.
pause
goto menu

:explorer
cls
echo Close this window once explorer launches.
explorer.exe
exit

:cmd
cls
color 0F
echo You are now in command prompt. For help, type either "HELP" or "SCMDHELP" for S-CMD specific commands.
cd C:\
echo -------------------------------------------0
echo.
cmd

:cmda
:: BatchGotAdmin
:-------------------------------------
REM  --> Check for permissions
>nul 2>&1 "net" "session"

REM --> If error flag set, we do not have admin.
if '%errorlevel%' NEQ '0' (
    echo Press Yes on the promp that appears.
    goto UACPrompt
) else ( goto gotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params = %*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %params%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:gotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
:--------------------------------------

:power
cls
echo Power Options
echo -------------------------------------------0
echo 1. Shut Down
echo 2. Restart
echo 3. Return to Launcher
set /p CHOICE="Pick the number corresponding to your choice and press ENTER: "

IF %CHOICE%==1 GOTO sh
IF %CHOICE%==2 GOTO rs
IF %CHOICE%==3 GOTO rt

:sh
shutdown /s /t 0

:rs
shutdown /r /t 0

:rt
goto menu
