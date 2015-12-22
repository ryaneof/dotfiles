# Add `~/bin` to the `$PATH`
export PATH="$HOME/.bin:$PATH"
export PATH="/usr/local/node/bin:$PATH";

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Load the shell dotfiles, and then some:
for file in ~/.{exports,aliases,functions,personal,}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

if type brew > /dev/null 2>&1 && [ -f "$(brew --prefix)/etc/bash_completion" ]; then
	source "$(brew --prefix)/etc/bash_completion";
fi;

if [ -d ~/.rbenv/ ]; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi
