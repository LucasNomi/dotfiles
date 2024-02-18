# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source prompt and aliases
for file in ~/.{bash_prompt,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done
unset file

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth

# Setting history length
HISTSIZE=1000
HISTFILESIZE=2000

# append to the history file, don't overwrite it
shopt -s histappend

shopt -s cdspell

# enable programmable completion features
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Added by Toolbox App
export PATH="$PATH:/home/lucas/.local/share/JetBrains/Toolbox/scripts"

# Run neofetch
#if ! [ -x "$(command -v neofetch)" ]; then
#  echo "Neofetch was not found"
#else
#  neofetch
#fi
