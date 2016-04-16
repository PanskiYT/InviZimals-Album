@echo off
title InviZimals Album Alpha A1IZ
mode 120, 40
:setup
echo ########## Album InviZimals ##########
echo.
echo Witamy w konfiguracji albumu InviZimals!
set /p name="Wprowadz nazwe albumu> "
echo %name% >"album_name.txt"
cls
echo ########## Album InviZimals ##########
echo.
echo Teraz wpisz swoj nick
set /p nick="Nick> "
pause