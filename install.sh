#!/bin/bash

DOWNLOADS=("neofetch" "tmux" "htop") 
if grep -q ID_LIKE=arch "/etc/os-release"; then
  sudo pacman -S ${DOWNLOADS[@]}
else
  sudo apt install ${DOWNLOADS[@]}
fi

echo "Installation done."

./config.sh


