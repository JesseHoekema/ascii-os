USERINFO_FILE="userinfo.txt"

# Controleren of userinfo.txt bestaat
if [ -f "$USERINFO_FILE" ]; then
    # Haal wachtwoord en gebruikersnaam op uit userinfo.txt
    password=$(grep "^Password:" "$USERINFO_FILE" | cut -d' ' -f2)
    username=$(grep "^Username:" "$USERINFO_FILE" | cut -d' ' -f2)

    # Toon de opgehaalde informatie $password $username
else
    bash <(curl -s https://raw.githubusercontent.com/JesseHoekema/ascii-os/main/new.sh)
    exit 1
fi
#!/bin/bash
echo -ne "\033]0;AsciiOs\a"

while true; do
    clear
    formatted_date=$(date "+%a %e %b %Y")
    echo "$formatted_date"
    echo "   "
    echo " ___     _______ _______ ___ __    _ 
|   |   |       |       |   |  |  | |
|   |   |   _   |    ___|   |   |_| |
|   |   |  | |  |   | __|   |       |
|   |___|  |_|  |   ||  |   |  _    |
|       |       |   |_| |   | | |   |
|_______|_______|_______|___|_|  |__|"
    echo "     "
    echo "Type Your Password and press Enter:"
    read userInput
    if [ "$userInput" == "$password" ]; then
        clear
        echo ".----------------------------------.
|     _             _ _  ___       |
|    / \   ___  ___(_|_)/ _ \ ___  |
|   / _ \ / __|/ __| | | | | / __| |
|  / ___ \\__ \ (__| | | |_| \__ \ |
| /_/   \_\___/\___|_|_|\___/|___/ |
'----------------------------------'"
        formatted_date=$(date "+%a %e %b %Y")
        echo "Hello User! And Welcome To AsciiOs Its $formatted_date"

        while true; do
                clear
        echo ".----------------------------------.
|     _             _ _  ___       |
|    / \   ___  ___(_|_)/ _ \ ___  |
|   / _ \ / __|/ __| | | | | / __| |
|  / ___ \\__ \ (__| | | |_| \__ \ |
| /_/   \_\___/\___|_|_|\___/|___/ |
'----------------------------------'"
        echo "Hello $username! And Welcome To AsciiOs Its $formatted_date"
            # Menu
            echo "+--------------------------+"
            echo "| Choose A App:            |"
            echo "| 1. Clock                 |"
            echo "| 2. Calculator            |"
            echo "| 3. Text Editor           |"
            echo "| 4. Files                 |"    
            echo "| 5. To-Do                 |"
            echo "| 6. Password Generator    |"
            echo "| 7. Help                  |"
            echo "| 8. Power Off             |"
            echo "| 9. Logout                |"
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
#!/bin/bash

while true; do
    clear
    echo "Eenvoudige Bestandsbeheerder"
    echo "+-----------------------------+"
    echo "| 1. Toon huidige map         |"
    echo "| 2. Toon bestanden           |"
    echo "| 3. Ga naar map              |"
    echo "| 4. Kopieer bestand/mappen   |"
    echo "| 5. Verplaats bestand/mappen |"
    echo "| 6. Verwijder bestand/mappen |"
    echo "| 7. Exit                     |"
    echo "+-----------------------------+"

    read -p "Voer het nummer van de gewenste actie in: " choice

    case $choice in
        1)
            clear
            pwd
            read -p "Druk op Enter om door te gaan..." enter
            ;;
        2)
            clear
            ls -l
            read -p "Druk op Enter om door te gaan..." enter
            ;;
        3)
            clear
            read -p "Voer het pad van de map in: " path
            cd "$path" || { echo "Fout bij het wijzigen van de map"; sleep 2; }
            ;;
        4)
            clear
            read -p "Voer het bestand/mappad in om te kopiëren: " source_path
            read -p "Voer het doelpad in: " destination_path
            cp -r "$source_path" "$destination_path"
            ;;
        5)
            clear
            read -p "Voer het bestand/mappad in om te verplaatsen: " source_path
            read -p "Voer het doelpad in: " destination_path
            mv "$source_path" "$destination_path"
            ;;
        6)
            clear
            read -p "Voer het bestand/mappad in om te verwijderen: " file_path
            rm -r "$file_path"
            ;;
        7)
            echo "Goodbye!"
            sleep 0.5
            break
            ;;
        *)
            echo "Ongeldige keuze. Probeer opnieuw."
            sleep 2
            ;;
    esac
done

                ;;
                5)
                clear
TODO_FILE="todo.txt"

initialize_todo_file() {
    touch "$TODO_FILE"
}

add_task() {
    local task="$1"
    echo "$task" >> "$TODO_FILE"
    echo "Task added: $task"
}

list_tasks() {
    echo "To-Do List:"
    if [ -s "$TODO_FILE" ]; then
        cat -n "$TODO_FILE"
    else
        echo "No tasks found."
    fi
}

remove_task() {
    local task_number="$1"
    if [ -s "$TODO_FILE" ]; then
        sed -i "${task_number}d" "$TODO_FILE"
        echo "Task removed."
    else
        echo "No tasks to remove."
    fi
}

clear_tasks() {
    > "$TODO_FILE"
    echo "All tasks have been cleared."
}

# Check if the todo file exists, otherwise create it
initialize_todo_file

while true; do
    echo -e "\n1. Add task"
    echo "2. List tasks"
    echo "3. Remove task"
    echo "4. Clear all tasks"
    echo "5. Exit"

    read -p "Enter the number of the desired action: " choice

    case $choice in
        1)
            read -p "Enter the new task: " new_task
            add_task "$new_task"
            ;;
        2)
            list_tasks
            ;;
        3)
            list_tasks
            read -p "Enter the task number to remove: " task_number
            remove_task "$task_number"
            ;;
        4)
            clear_tasks
            ;;
        5)
            echo "Goodbye!"
            sleep 0.5
            break
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
done

                ;;
                6)
                clear
                generate_password() {
                    local length=$1

                   if [ -z "$length" ]; then
                    length=12  # Standaardlengte als niet opgegeven
                    fi

                    # De tr -dc '[:print:]' zorgt ervoor dat alleen afdrukbare ASCII-tekens worden behouden
                    password=$(openssl rand -base64 48 | tr -dc '[:print:]' | head -c"$length")
                    echo "$password"
                }

                echo "Welcome!"
                read -p "Enter a Password Length (Default 12): " pass_length

                generated_password=$(generate_password "$pass_length")

                echo "The generated password is: $generated_password"
                echo "Type Close To Close The App:"
                read userInput
                    case $userInput in 
                    close)
                        clear
                        ;;
                    esac
                ;;
                7)
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
                8)
                    clear
                    echo "Powering Off..."
                    clear
                    exit 0
                    ;;
                9)
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
