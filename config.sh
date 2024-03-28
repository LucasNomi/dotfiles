#!/bin/bash

CONFIG=("git" "neofetch" "tmux" "vim")

if ! [ -x "$(command -v stow)" ]; then
    echo "stow not found"
    if grep -q ID_LIKE=arch "/etc/os-release"; then
      sudo pacman -S stow
    else
      sudo apt install stow
    fi
else
    echo "Proceeding to configuration..."
fi

for str in ${CONFIG[@]}; do
    if [ -x "$(find . -maxdepth 1 -name $str)" ]; then
	echo "Directory for $str configuration found"
	echo "Link configuration contents to:"
	select pth in HOME CONFIG JUMP
	do
	    case $pth in
        "HOME")
          stow -t $HOME $str
          break;;
        "CONFIG")
          stow -t $HOME/.config/ $str
          break;;
        "JUMP")
          echo "Jumping to next configuration"
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
