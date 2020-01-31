# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' verbose true
zstyle ':completion:*' special-dirs true

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_history
HISTSIZE=900000
SAVEHIST=900000
setopt INC_APPEND_HISTORY
bindkey -e

setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' actionformats \
    ' %F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       \
    ' %F{5}[%F{2}%b%F{5}]%f '
zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat '%b%F{1}:%F{3}%r'

zstyle ':vcs_info:*' enable git

vcs_info_wrapper() {
	vcs_info
	if [ -n "$vcs_info_msg_0_" ]; then
		echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del"
	fi
}

alias ls='ls --color=auto'
alias ll='ls -la'
alias exacloud='docker run -it --mount type=bind,source="${HOME}/.config/gcloud",target="/root/.config/gcloud,readonly" eu.gcr.io/verdant-ethos-150510/exacloud:latest'

# Nice prompt
COLOR=`echo -n '\e[1;32m'`
for host in `hostname -f` `hostname`; do
        case $host in
		maxwell.rustad.me)   COLOR=`echo -n '\e[1;36m'` ;;
		nilfisk)             COLOR=`echo -n '\e[1;39m'` ;;
		gauss)               COLOR=`echo -n '\e[1;34m'` ;;
		hilbert)             COLOR=`echo -n '\e[1;35m'` ;;
        esac
done
PROMPT=`echo %j '%(!.%{\e[1;31m%}%n.%{\e[1;30m%}%n)%{\e[0;37m%}@%{'${COLOR}'%}%m%{\e[m%}:%{\e[1;33m%}%30<..<%~%{\e[m%}$(vcs_info_wrapper)%(!.#.>) '`

export EDITOR=vim

# End of lines configured by zsh-newuser-install
