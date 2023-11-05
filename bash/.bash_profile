case $- in
    *i*) ;;
      *) return;;
esac

for file in ~/.{bash_prompt,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done
unset file

export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

HISTCONTROL=ignoreboth
HISTSIZE=1000
HISTFILESIZE=2000
shopt -s cdspell

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if ! [ -x "$(command -v neofetch)" ]; then
  echo "Neofetch was not found"
else
  neofetch
fi
