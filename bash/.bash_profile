case $- in
    *i*) ;;
      *) return;;
esac

for file in ~/.{bash_prompt,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file";
done
unset file

export LSP_USE_PLIST=true
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

HISTCONTROL=ignoreboth
HISTSIZE=50
HISTFILESIZE=0
shopt -s autocd
shopt -s cdspell

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

if ! [ -x "$(command -v neofetch)" ]; then
  echo "Neofetch is not installed!"
else
  neofetch
fi

if ! [ -d "$HOME/.asdf" ]; then
  echo "ASDF is not installed!"
else
  source "$HOME/.asdf/asdf.sh"
  source "$HOME/.asdf/completions/asdf.bash"
fi
