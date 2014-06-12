# Add `~/bin` to the `$PATH`
export PATH="$HOME/.bin:$PATH"

# Load the shell dotfiles, and then some:
for file in ~/.{exports,aliases,personal,}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

if [ -f ~/.scripts/git-completion.bash ]; then
	. ~/.scripts/git-completion.bash
fi

if [ -f ~/.scripts/npm-completion.bash ]; then
	. ~/.scripts/npm-completion.bash
fi

if [ -d ~/.rbenv/ ]; then
	export PATH="$HOME/.rbenv/bin:$PATH"
	eval "$(rbenv init -)"
fi
