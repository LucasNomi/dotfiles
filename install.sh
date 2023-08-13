#!/bin/bash
source programs.sh 

sudo apt install ${PROGRAMS[@]}

echo "Installation done."

./config.sh


