# .bashrc

PS1='\[\e[32m\]┌──(\[\e[38;5;214m\]\u\[\e[0m\]@\h\[\e[0;32m\])-[\[\e[38;5;46;1m\]\w\[\e[0;32m\]] [\[\e[32m\]$?\[\e[32m\]]\n\[\e[32m\]╰─\[\e[94;1m\]\$\[\e[0m\] '

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi

unset rc

export FLYCTL_INSTALL="/$HOME/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
export PATH="$PATH:/usr/local/lib/blpapi_cpp_3.25.7.1/Linux"
export BLPAPI_LIB="/usr/local/lib/blpapi_cpp_3.25.7.1/Linux"
export PATH="$PATH:~/dev/dotfiles"

export PATH="$PATH:$HOME/Documents/Private/01_Programming/Flutter/flutter/bin"
. "$HOME/.cargo/env"
source $HOME/Downloads/alacritty/extra/completions/alacritty.bash
