#!/bin/bash

# Functie om een wachtwoord te genereren
generate_password() {
    local length=$1

    if [ -z "$length" ]; then
        length=12  # Standaardlengte als niet opgegeven
    fi

    # De tr -dc '[:print:]' zorgt ervoor dat alleen afdrukbare ASCII-tekens worden behouden
    password=$(openssl rand -base64 48 | tr -dc '[:print:]' | head -c"$length")
    echo "$password"
}

# Bestandsnaam waarin de gebruikersinformatie wordt opgeslagen
USERINFO_FILE="userinfo.txt"

# Controleren of userinfo.txt al bestaat
if [ -f "$USERINFO_FILE" ]; then
    echo "User information file already exists. Running specific command..."
    # Voer het specifieke commando uit als het bestand al bestaat
    bash <(curl -s https://raw.githubusercontent.com/JesseHoekema/ascii-os/main/os.sh)
else
    echo "Welcome to AsciiOs!"

    # Vraag om het wachtwoord
    echo "Enter the password (default password is 'password'): "
    read -s password_input  # -s voor stille invoer (geen echo naar terminal)
    password=${password_input:-password}  # Standaardwachtwoord 'password' instellen als geen input

    # Vraag om de naam van de gebruiker
    echo "Enter your name: "
    read username

    # Opslaan van de gegevens in userinfo.txt
    echo "Username: $username" > "$USERINFO_FILE"
    echo "Password: $password" >> "$USERINFO_FILE"

    echo "User information saved in userinfo.txt."
fi
