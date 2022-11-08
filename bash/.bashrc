# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

for file in ~/.bashrc.d/*.bashrc;
do
	source "$file"
done

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
. /usr/share/git-core/contrib/completion/git-prompt.sh

if [ -f "/run/.containerenv" ]; then
	TOOLBOX_NAME=[container-$(cat /run/.containerenv | grep 'name=' | sed -e 's/^name="\(.*\)"$/\1/')]
else
	TOOLBOX_NAME="$(hostname)"
fi

PS1='\[\033[00;32m\]\u@\[\033[00;36m\]$TOOLBOX_NAME:\[\033[01;31m\]\w\[\033[31m\]$(__git_ps1 "(%s)") \[\033[00m\]$\[\033[00m\] '


alias sshpwd='ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no'
alias agent='eval "$(ssh-agent -s)" && ssh-add ~/.ssh/id_rsa && ssh-add -s /usr/lib64/opensc-pkcs11.so'

genpwd() {
	local l=$1
       	[ "$l" == "" ] && l=16
      	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
export GOPATH=$HOME/go

[[ $TERM == "alacritty" ]] && exec tmux new -A -s main

ssh() {
  if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm= | cut -d : -f1)" = "tmux" ]; then
        tmux rename-window "$(echo $* | cut -d . -f 1)"
        command ssh "$@"
        tmux set-window-option automatic-rename "on" 1>/dev/null
    else
        command ssh "$@"
    fi
}

alias pass='toolbox run  --container pass pass'
export TILLER_NAMESPACE=tiller

export PATH=$GOPATH/bin:$PATH


