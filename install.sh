#!/bin/bash

DOWNLOADS=("neofetch" "tmux" "htop" "alacritty" "rofi" "i3" "i3status" "dmenu" "feh") 

sudo apt install ${DOWNLOADS[@]}

echo "Installation done."

./config.sh


