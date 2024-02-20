#!/bin/bash

DOWNLOADS=("neofetch" "tmux" "htop") 

sudo apt install ${DOWNLOADS[@]}

echo "Installation done."

./config.sh


