# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' verbose true
zstyle ':completion:*' special-dirs true
zstyle :compinstall filename '/home/cassarossa/itk/bjornrus/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=900000
SAVEHIST=900000
bindkey -e

alias ls='ls --color=auto'
alias ll='ls -la'

# Nice prompt
COLOR=`echo -n '\e[1;32m'`
for host in `hostname -f` `hostname`; do
        case $host in
		maxwell.rustad.me)   COLOR=`echo -n '\e[1;36m'` ;;
		nilfisk)             COLOR=`echo -n '\e[1;39m'` ;;
		gauss)               COLOR=`echo -n '\e[1;34m'` ;;
                *.samfundet.no)      COLOR=`echo -n '\e[1;33m'` ;;
        esac
done
PROMPT=`echo %j '%(!.%{\e[1;31m%}%n.%{\e[1;30m%}%n)%{\e[0;37m%}@%{'${COLOR}'%}%m%{\e[m%}:%{\e[1;33m%}%30<..<%~%{\e[m%}%(!.#.>) '`

export EDITOR=vim

# End of lines configured by zsh-newuser-install
