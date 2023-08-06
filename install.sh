#!/bin/bash

programs=("neofetch" "emacs" "vim" "git" "tmux" "alacritty")

for str in ${programs[@]}; do
    if ! [ -x "$(command -v $str)" ]; then
        echo "$str not found."
        echo "Proceeding to installation..."
        sudo apt install $str 2>/dev/null
    else
        echo "$str found"
    fi
done


