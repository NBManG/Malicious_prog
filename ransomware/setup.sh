#!/bin/bash

# Define paths for files and directories
NGINX_CONF="/home/attacker/local/nginx/conf/nginx.conf"
CONFIG_FILE="./nginx.conf"
PYTHON_FILE="./backend.py"
IMPORTANT_FILE="important_file"
IMPORTANT_CONTENT="this is a test file to test the file encryption"
MALICIOUS_FOLDER="./malicious"
ATTACKER_SOURCES="/home/attacker/sources"
TARGET_DIRECTORIES=("/home/student/" "/home/student/secret" "/var/" "/usr/")
ATTACKER_LOOT="/home/attacker/loot"

# 1. Replace nginx.conf with a.conf
echo "Replacing nginx config..."
sudo cp "$CONFIG_FILE" "$NGINX_CONF"

# 2. Copy a.py into /home/attacker/
echo "Copying backend server..."
sudo cp "$PYTHON_FILE" "/home/attacker/"

# 3. Create the important file and place it in specified directories
echo "Creating important_file in multiple locations..."
for DIR in "${TARGET_DIRECTORIES[@]}"; do
    sudo mkdir -p "$DIR"  # Ensure the directory exists
    echo "$IMPORTANT_CONTENT" | sudo tee "$DIR/$IMPORTANT_FILE" > /dev/null
done

# 4. Copy the 'malicious' folder and its contents into /home/attacker/sources
echo "Copying malicious folder..."
sudo cp -r "$MALICIOUS_FOLDER" "$ATTACKER_SOURCES"

echo "Creating new directory at $ATTACKER_LOOT..."
sudo mkdir -p "$ATTACKER_LOOT"

echo "Setup complete."

