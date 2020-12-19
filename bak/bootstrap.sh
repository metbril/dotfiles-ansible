#!/usr/bin/env bash

# Bootstrap a new computer

if [[ "$OSTYPE" == "darwin"* ]]; then
    # Mac OSX

    # If needed, install command line tools (brew pre-requisite)
    # https://stackoverflow.com/q/30533039
    check="$(xcode-\select --install 2>&1)"
    echo $check
    str="xcode-select: note: install requested for command line developer tools"
    while [[ "$check" == "$str" ]];
    do
        check="$(xcode-\select --install 2>&1)"
        sleep 1
    done

    # If needed, install homebrew
    command -v brew >/dev/null 2>&1 || { echo "Installing homebrew..."; /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; }

    # Install ansible
    command -v brew >/dev/null 2>&1 || { echo "Installing ansible..."; brew update; brew install ansible; }

elif [[ "$OSTYPE" == "linux"* ]]; then

    # Install ansible
    apt update
    apt install ansible

else
    # OS not suppported by script
    echo
fi

echo "Running playbook..."
cd ansible
ansible-galaxy install -r requirements.yml
ansible-playbook macos.yml -i inventory.cfg --ask-become-pass
