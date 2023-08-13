#!/bin/bash
source programs.sh 
for str in ${PROGRAMS[@]}; do
    if ! [ -x "$(command -v $str)" ]; then
        echo "$str not found"
        echo "Proceeding to installation..."
        sudo apt install $str
    else
        echo "$str found"
    fi
done
echo "Installation done."
./config.sh


