# Add `~/bin` to the `$PATH`
export PATH="$HOME/.bin:$PATH"

# Load the shell dotfiles, and then some:
for file in ~/.{exports,aliases,personal,}; do
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
