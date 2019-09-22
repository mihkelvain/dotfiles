# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

export EDITOR=vim
export GOPATH=$HOME/go/
PATH=$PATH:$HOME/.local/bin:$HOME/bin:$GOPATH/bin
export PATH
