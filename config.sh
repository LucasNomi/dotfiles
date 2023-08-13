#!/bin/bash
source programs.sh

if ! [ -x "$(command -v stow)" ]; then
    echo "stow not found"
    sudo apt install stow
else
    echo "Proceeding to configuration..."
fi

for str in ${PROGRAMS[@]}; do
    if [ -x "$(find . -name $str)" ]; then
	echo "Directory for $str configuration found"
	echo "Link configuration contents to:"
	select pth in HOME CONFIG
	do
	    case $pth in
		"HOME")
		    echo "Create a directory in HOME?"
		    select confirm in Y N
		    do
			case $confirm in
			    "Y")
				echo "Name the configuration directory (LEAVE BLANK TO USE THE DEFAULT): "
				read c_name
				if [[ "$c_name" == '' ]]; then
				    if [ -x "$(find $HOME -maxdepth 1 -name $str)" ]; then
					stow -t $HOME/$str $str
				    else
					mkdir $HOME/$str
					stow -t $HOME/$str $str
				    fi
				else
				    mkdir $HOME/$c_name
				    stow -t $HOME/$c_name $str
				fi
				break;;
			    *)
				stow -t $HOME $str
				break;;
			esac
		    done
		break;;
		"CONFIG")
		    echo "Create a directory in CONFIG?"
		    select confirm in Y N
		    do
			case $confirm in
			    "Y")
				echo "Name the configuration directory (LEAVE BLANK TO USE THE DEFAULT): "
				read c_name
				if [[ "$c_name" == '' ]]; then
				    if [ "$(find $HOME/.config -maxdepth 1 -name $str)" ]; then
					stow -t $HOME/.config/$str $str
				    else
					mkdir $HOME/.config/$str
					stow -t $HOME/.config/$str $str
				    fi
				else
				    mkdir $HOME/.config/$c_name
				    stow -t $HOME/.config/$c_name $str
				fi
				break;;
			    *)
				stow -t $HOME $str
				break;;
			esac
		    done
		break;;
		*)
		    echo "Is not a valid path";;
	    esac
	done
    else
        echo "Directory for $str configuration not found"
        echo "Configuration for $str stopped."
    fi
done

echo "Configuration done."
