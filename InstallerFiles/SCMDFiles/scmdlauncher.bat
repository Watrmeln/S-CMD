@echo off
title S-CMD Launcher Build 1
taskkill /IM explorer.exe /F

CSCRIPT //nologo fullscreen.vbs

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
echo S-CMD LAUNCHER         BUILD 1 - AUG 12 2023
echo -------------------------------------------0
echo.
echo Welcome to the S-CMD Launcher! What would you like to do?
echo -------------------------------------------0
echo 1. Launch explorer (default windows shell)
echo 2. Launch into CMD (Command Prompt)
echo 3. Launch into CMD as administrator
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
echo The option you chose was invalid! Please try again.
pause
goto menu

:explorer
cls
CSCRIPT //nologo fullscreen.vbs
echo Once explorer is open, feel free to close this window!
explorer.exe
exit

:cmd
