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
setopt INC_APPEND_HISTORY_TIME
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

kubectx_wrapper() {
	if [[ "$PWD" == *"kubernetes"* ]]; then
		echo "$(kube_ps1)"
	fi
}

format_cluster_name() {
	if [[ "$1" == *"prod"* ]]; then
		echo $1 | tr '[:lower:]' '[:upper:]'
	else
		echo $1
	fi
}

alias ls='ls --color=auto'
alias ll='ls -la'

source ~/bin/kube-ps1.sh
export KUBE_PS1_NS_ENABLE=true
export KUBE_PS1_SYMBOL_ENABLE=false
export KUBE_PS1_SUFFIX=") "
export KUBE_PS1_CLUSTER_FUNCTION=format_cluster_name

# Nice prompt
COLOR=`echo -n '\e[1;32m'`
for host in `hostname -f` `hostname`; do
        case $host in
		maxwell.rustad.me)   COLOR=`echo -n '\e[1;36m'` ;;
		nilfisk)             COLOR=`echo -n '\e[1;39m'` ;;
		gauss)               COLOR=`echo -n '\e[1;34m'` ;;
		hilbert)             COLOR=`echo -n '\e[1;35m'` ;;
		conway)              COLOR=`echo -n '\e[1;92m'` ;;
		banach)              COLOR=`echo -n '\e[1;94m'` ;;
		godel)               COLOR=`echo -n '\e[1;95m'` ;;
		wigner)              COLOR=`echo -n '\e[1;96m'` ;;
        esac
done
PROMPT=`echo %j '$(kubectx_wrapper)%{\e[0;37m%}%{\e[1;33m%}%45<..<%~%{\e[m%}$(vcs_info_wrapper)%(!.#.>) '`
#PROMPT=`echo %j '$(kubectx_wrapper)%(!.%{\e[1;31m%}%n.%{\e[1;30m%}%n)%{\e[0;37m%}@%{'${COLOR}'%}%m%{\e[m%}:%{\e[1;33m%}%45<..<%~%{\e[m%}$(vcs_info_wrapper)%(!.#.>) '`

export EDITOR=vim

export PATH=$PATH:$HOME/bin

export IBUS_DISCARD_PASSWORD_APPS='firefox,.*chrome.*'

alias wow='git status'
alias vzf='vim $(fzf)'
alias bzf='bat $(fzf)'

if [[ -f "/usr/share/doc/fzf/examples/completion.zsh" ]];
then
	source /usr/share/doc/fzf/examples/completion.zsh
fi
if [[ -f "/usr/share/doc/fzf/examples/key-bindings.zsh" ]];
then
	source /usr/share/doc/fzf/examples/key-bindings.zsh
fi

if [[ -f "/home/burk/.config/broot/launcher/bash/br" ]];
then
	source /home/burk/.config/broot/launcher/bash/br
fi

export SSH_AUTH_SOCK=/run/user/1000/keyring/ssh

if [[ $(hostname -f) == "selberg" ]]; then
	export JAVA_HOME="/usr/lib/jvm/java-17-openjdk-amd64"
	export PYENV_ROOT="$HOME/.pyenv"
	export PATH="$PYENV_ROOT/bin:$PATH"
	export PATH=$PATH:$HOME/.local/bin:$HOME/.cargo/bin:$JAVA_HOME/bin

	eval "$(pyenv init -)"
	
	# The next line updates PATH for the Google Cloud SDK.
	if [[ -f '/home/burk/apps/google-cloud-sdk/path.zsh.inc' ]];
	then
		. '/home/burk/apps/google-cloud-sdk/path.zsh.inc';
	fi
	
	# The next line enables shell command completion for gcloud.
	if [[ -f '/home/burk/apps/google-cloud-sdk/completion.zsh.inc' ]];
	then
		. '/home/burk/apps/google-cloud-sdk/completion.zsh.inc';
	fi
	
	export LD_LIBRARY_PATH=/opt/intel/lib/intel64:/opt/intel/mkl/lib/intel64
fi


