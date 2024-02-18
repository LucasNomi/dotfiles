#!/bin/bash

CONFIG=("git" "neofetch" "tmux" "htop" "alacritty" "rofi" "i3" "i3status")

if ! [ -x "$(command -v stow)" ]; then
    echo "stow not found"
    sudo apt install stow
else
    echo "Proceeding to configuration..."
fi

for str in ${CONFIG[@]}; do
    if [ -x "$(find . -maxdepth 1 -name $str)" ]; then
	echo "Directory for $str configuration found"
	echo "Link configuration contents to:"
	select pth in HOME CONFIG
	do
	    case $pth in
        "HOME")
          stow -t $HOME $str
          break;;
        "CONFIG")
          stow -t $HOME/.config/ $str
          break;;
        *)
          echo "Invalid option"
	    esac
	done
    else
        echo "Directory for $str configuration not found"
        echo "Configuration for $str stopped."
    fi
done

echo "Configuration done."
