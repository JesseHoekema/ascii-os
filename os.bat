@echo off
cls
echo Setting window title...
title AsciiOs

:login
cls
echo Enter password:
set /p userInput=

if "%userInput%"=="password" (
    cls
    echo .----------------------------------.
    echo ^|     _             _ _  ___       ^|
    echo ^|    / \   ___  ___(_^|_)/ _ \ ___  ^|
    echo ^|   / _ \ / __|/ __| | ^| ^| | / __| ^|
    echo ^|  / ___ \\\__ \ (__| | ^| |_| \__ \ ^|
    echo ^| /_/   \_\___/\___^|_^|\___/|___/ ^|
    echo '----------------------------------'
    echo Hello User! And Welcome To AsciiOs It's %date%
    
    :main_menu
    cls
    echo .----------------------------------.
    echo ^|     _             _ _  ___       ^|
    echo ^|    / \   ___  ___(_^|_)/ _ \ ___  ^|
    echo ^|   / _ \ / __|/ __| | ^| ^| | / __| ^|
    echo ^|  / ___ \\\__ \ (__| | ^| |_| \__ \ ^|
    echo ^| /_/   \_\___/\___^|_^|\___/|___/ ^|
    echo '----------------------------------'
    echo Hello User! And Welcome To AsciiOs It's %date%
    echo +--------------------------+
    echo ^| Choose An App:           ^|
    echo ^| 1. Clock                  ^|
    echo ^| 2. Calculator             ^|
    echo ^| 3. Text Editor            ^|
    echo ^| 4. Files                  ^|
    echo ^| 5. To-Do                  ^|
    echo ^| 6. Password Generator     ^|
    echo ^| 7. Help                   ^|
    echo ^| 8. Power Off              ^|
    echo ^| 9. Logout                 ^|
    echo +--------------------------+
    set /p choice="Enter your choice: "

    if "%choice%"=="1" (
        cls
        echo Current time: %time%
        pause
        goto main_menu
    ) else if "%choice%"=="2" (
        cls
        set /p "expression=Calculator Enter A Calculation: "
        set /a "result=%expression%"
        echo Result: %result%
        pause
        goto main_menu
    ) else if "%choice%"=="3" (
        cls
        echo Text Editor
        notepad
        cls
        goto main_menu
    ) else if "%choice%"=="4" (
        cls
        echo "Files"
        echo "TODO: Implement file operations"
        pause
        goto main_menu
    ) else if "%choice%"=="5" (
        cls
        echo "To-Do"
        echo "TODO: Implement To-Do functionality"
        pause
        goto main_menu
    ) else if "%choice%"=="6" (
        cls
        echo "Password Generator"
        echo "TODO: Implement password generation"
        pause
        goto main_menu
    ) else if "%choice%"=="7" (
        cls
        echo .--------------------------------.
        echo ^|  _   _      _                  ^|
        echo ^| | | | | ___| |_ __             ^|
        echo ^| | |_| |/ _ \ | '_ \            ^|
        echo ^| |  _  |  __/ | |_) |           ^|
        echo ^| |_|_|_|\___|_| .__/            ^|
        echo ^|  / ___|___ _ |_|| |_ ___ _ __  ^|
        echo ^| | |   / _ \ '_ \| __/ _ \ '__| ^
        echo ^| | |__|  __/ | | | ||  __/ |    ^
        echo ^|  \____\___|_| |_|\__\___|_|    ^
        echo '--------------------------------'
        echo "'---------------------------------------------------'"
        echo ^|1. To Close An App Type Close                      ^|
        echo ^|2. The Password Is: password (you cannot change it)^|
        echo ^|3. You Cannot Install Updates On The Os            ^|
        echo ^|4. You Cannot Change Any Settings                  ^|
        echo "'---------------------------------------------------'"
        echo .-----------------------------.
        echo ^| ___                         ^|
        echo ^||_ _|___ ___ _   _  ___  ___ ^
        echo ^| | |/ __/ __| | | |/ _ \/ __^|
        echo ^| | |\__ \__ \ |_| |  __/\__ \^|
        echo ^||___|___/___/\__,_|\___||___/ ^
        echo '-----------------------------'
        echo "'---------------------------------------------------'"
        echo ^| 1. Time Is Only Updating If You Login             ^
        echo "'---------------------------------------------------'"
        pause
        goto main_menu
    ) else if "%choice%"=="8" (
        cls
        echo Powering Off...
        timeout /nobreak /t 2 >nul
        exit /b
    ) else if "%choice%"=="9" (
        cls
        echo Logout...
        goto login
    ) else (
        cls
        echo Invalid command
        timeout /nobreak /t 2 >nul
        goto main_menu
    )
) else (
    cls
    echo Invalid Password!
    timeout /nobreak /t 2 >nul
    goto login
)
