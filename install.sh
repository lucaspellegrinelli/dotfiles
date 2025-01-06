#!/bin/bash

CODE_SERVER_BINARY="/tmp/code-server/bin/code-server"
SETTINGS_FILE="$HOME/.local/share/code-server/User/settings.json"
KEYBINDINGS_FILE="$HOME/.local/share/code-server/User/keybindings.json"
MAX_RETRIES=30
RETRY_INTERVAL=2

ensure_jq_installed() {
    echo "Checking if jq is installed..."
    if ! command -v jq &> /dev/null; then
        echo "jq not found. Installing jq..."
        sudo apt update && sudo apt install -y jq
        if ! command -v jq &> /dev/null; then
            echo "Error: jq installation failed. Please install it manually."
            exit 1
        fi
    else
        echo "jq is already installed."
    fi
}

wait_for_code_server() {
    echo "Waiting for code-server binary to be ready..."
    for ((i=1; i<=MAX_RETRIES; i++)); do
        if [ -x "$CODE_SERVER_BINARY" ]; then
            echo "code-server binary is ready."
            return 0
        fi
        echo "Attempt $i: code-server binary not ready. Retrying in $RETRY_INTERVAL seconds..."
        sleep "$RETRY_INTERVAL"
    done
    echo "Error: code-server binary not found or not executable after $((MAX_RETRIES * RETRY_INTERVAL)) seconds."
    exit 1
}

merge_json() {
    local existing_file=$1
    local new_file=$2

    if [ -f "$existing_file" ]; then
        jq -s '.[0] * .[1]' "$existing_file" "$new_file" > "${existing_file}.tmp"
        mv "${existing_file}.tmp" "$existing_file"
    else
        cp "$new_file" "$existing_file"
    fi
}

install_extensions() {
    echo "Installing extensions..."
    "$CODE_SERVER_BINARY" --install-extension vscodevim.vim
    "$CODE_SERVER_BINARY" --install-extension catppuccin.catppuccin-vsc
}

setup_user_files() {
    echo "Setting up user files..."
    mkdir -p "$(dirname "$SETTINGS_FILE")"
    merge_json "$SETTINGS_FILE" "user_settings.json"
    merge_json "$KEYBINDINGS_FILE" "keybindings.json"
}

# Main Script

ensure_jq_installed
wait_for_code_server
setup_user_files
install_extensions