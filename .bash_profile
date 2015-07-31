# Add `~/bin` to the `$PATH`
export PATH="$HOME/.bin:$PATH"

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Load the shell dotfiles, and then some:
for file in ~/.{exports,aliases,functions,personal,}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

for file in ./.scripts/*.bash; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done

if [ -d ~/.rbenv/ ]; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi

complete -o bashdefault -o default -o nospace -F _git g 2>/dev/null \
    || complete -o default -o nospace -F _git g
