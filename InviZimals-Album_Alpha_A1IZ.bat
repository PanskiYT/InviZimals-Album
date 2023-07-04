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
set /p option="Wprowadź opcję:> "
if %option% == 1 ( call :Dodaj)
if %option% == 3 ( call :Wychodzić)

REM Funkcja wyjścia z programu
:Wychodzić
echo Do zobaczenia później %nick%. Teraz wystarczy nacisnąć klawisz, aby wyjść.
pause
exit

:Dodaj
set /p nameInvizimal="Wprowadź nazwę invizimal> "
set /p lifeInvizimal="wejść w życie %nameInvizimal%> "
set /p resistanceInvizimal="Wprowadź rezystancję %nameInvizimal%> "
set /p rechageInvizimal="Wprowadź doładowanie%nameInvizimal%> "
set /p attackInvizimal="wejść do ataku %nameInvizimal%> "
set /p armorInvizimal="Wejdź do zbroi %nameInvizimal%> "
set /p Save="Bezpieczne do nagrywania %nameInvizimal%? (1:Y/0:N)> "
if %Save% == 1 (
    echo %nameInvizimal%:%lifeInvizimal%:%resistanceInvizimal%:%rechageInvizimal%:%attackInvizimal%:%armorInvizimal% >> "%name%.txt"
    echo "Pomyślnie zarejestrowano do " %nameInvizimal%.
) else (
    echo No se han guardado todos los datos de %nameInvizimal%.
    goto :menu_glowne
)
set /p SaveAgain="Chcesz zarejestrować kolejnego Invizimala? (1:Y/0:N)> "
if %SaveAgain% == 1 (
goto :Dodaj
) else (
    goto :menu_glowne
)


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

