#!/bin/bash
echo -ne "\033]0;AsciiOs\a"

while true; do
    clear
    echo "Type 'password' and press Enter:"
    read userInput
    if [ "$userInput" == "password" ]; then
        clear
        echo ".----------------------------------.
|     _             _ _  ___       |
|    / \   ___  ___(_|_)/ _ \ ___  |
|   / _ \ / __|/ __| | | | | / __| |
|  / ___ \\__ \ (__| | | |_| \__ \ |
| /_/   \_\___/\___|_|_|\___/|___/ |
'----------------------------------'"
        echo "Hello User! And Welcome To AsciiOs Its $(date)"

        while true; do
                clear
        echo ".----------------------------------.
|     _             _ _  ___       |
|    / \   ___  ___(_|_)/ _ \ ___  |
|   / _ \ / __|/ __| | | | | / __| |
|  / ___ \\__ \ (__| | | |_| \__ \ |
| /_/   \_\___/\___|_|_|\___/|___/ |
'----------------------------------'"
        echo "Hello User! And Welcome To AsciiOs Its $(date)"
            # Menu
            echo "+--------------------------+"
            echo "| Choose A App:            |"
            echo "| 1. Clock                 |"
            echo "| 2. Calculator            |"
            echo "| 3. Text Editor           |"
            echo "| 4. Help                  |"
            echo "| 5. Power Off             |"
            echo "| 6. Logout                |"
            echo "+--------------------------+"
            read choice

            case $choice in
                1)
                    clear
                    clear  # Wissen van het terminalvenster voor elke iteratie
                    echo "Huidige tijd: $(date "+%T")"
                    sleep 1
                    read userInput
                    case $userInput in 
                    close)
                        clear
                        ;;
                    esac
                    ;;
                2)
                    clear
                    echo "Calculator Enter A Calculation:"
                    read expression
                    result=$(echo "$expression" | bc -l)
                    echo "Result: $result"
                    read userInput
                    case $userInput in 
                    close)
                        clear
                        ;;
                    esac
                    ;;
                3)
                    clear
                    echo "Text Editor"
                    nano  # Start de nano teksteditor
                    clear
                    ;;
                4)
                    clear
                    echo ".--------------------------------.
|  _   _      _                  |
| | | | | ___| |_ __             |
| | |_| |/ _ \ | '_ \            |
| |  _  |  __/ | |_) |           |
| |_|_|_|\___|_| .__/            |
|  / ___|___ _ |_|| |_ ___ _ __  |
| | |   / _ \ '_ \| __/ _ \ '__| |
| | |__|  __/ | | | ||  __/ |    |
|  \____\___|_| |_|\__\___|_|    |
'--------------------------------'"
                    echo "'---------------------------------------------------'"
                    echo "|1. To Close An App Type Close                      |"
                    echo "|2. The Password Is: password (you cannot change it)|"
                    echo "|3. You Cannot Install Updates On The Os            |"
                    echo "|4. You Cannot Change Any Settings                  |"
                    echo "'---------------------------------------------------'"
                    echo ".-----------------------------.
| ___                         |
||_ _|___ ___ _   _  ___  ___ |
| | |/ __/ __| | | |/ _ \/ __||
| | |\__ \__ \ |_| |  __/\__ \|
||___|___/___/\__,_|\___||___/|
'-----------------------------'"
                    echo "'---------------------------------------------------'"
                    echo "| 1. Time Is Only Updating If You Login             |"
                    echo "'---------------------------------------------------'"
                    read userInput
                    case $userInput in 
                    close)
                        clear
                        ;;
                    esac
                    ;;
                5)
                    clear
                    echo "Powering Off..."
                    clear
                    exit 0
                    ;;
                6)
                    clear
                    echo "Logout..."
                    break  # Breek uit de huidige lus om het 'hallo'-scherm opnieuw weer te geven
                    ;;
                *)
                    echo "Invailid command"
                    sleep 2
                    clear
                    ;;
            esac
            # Voeg een lege regel toe voor duidelijkheid
            echo
        done
    else
        echo "Invailid Password!"
        sleep 2
        clear
    fi
done
