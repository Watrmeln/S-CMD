@echo off

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
CSCRIPT //nologo scmdfullscreen.vbs
scmdlauncher.bat