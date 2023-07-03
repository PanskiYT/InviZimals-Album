@echo off
title InviZimals Album Alpha A1IZ
mode 120, 40

REM Zabarwienie
set "kolor_tła=0"
set "kolor_tekstu=7"

REM Funkcja czyszczenia ekranu
:czysty_ekran
cls
color %kolor_tła%%kolor_tekstu%


REM Funkcja do konfiguracji
:konfiguracji
cls
echo ########## Album InviZimals ##########
echo.
echo Witamy w konfiguracji albumu InviZimals!
set /p name="Wprowadz nazwe albumu> "
call :wazne_istnienie_albumu
:uzytkownik
echo ########## Album InviZimals ##########
echo.
echo Teraz wpisz swoj nick
set /p nick="Nick> "
echo.
echo Powitanie %nick%


REM Funkcja wyświetlania menu głównego
:menu_glowne
echo ########Indeks albumów########
echo 1. Wymień Invizimals.
echo 2. Dodaj Invizimals.
echo 3. Wychodzić
echo.
pause


:Wychodzić
echo Do zobaczenia później %nick%. Teraz wystarczy nacisnąć klawisz, aby wyjść.
pause
exit






REM Funkcja sprawdzania poprawności istnienia albumu
:wazne_istnienie_albumu
if exist "%name%.txt" (
   echo "Album już istnieje."
   call :kolejny_album
) else (
    echo "" > "%name%.txt"
    echo "Utworzono album. Naciśnij dowolny klawisz, aby kontynuować."
    pause
    goto  :uzytkownik
)



REM Funkcja zapytaj, czy chcesz utworzyć kolejny album
:kolejny_album
set /p ponownieUtworzyc="Czy chcesz utworzyć inny?(1:Y/0:N)> "
if %ponownieUtworzyc% == 1 ( 
    goto :konfiguracji
) 
else 
(
    goto :uzytkownik
)

