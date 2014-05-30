# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

# Load the shell dotfiles, and then some:
# * ~/.path can be used to extend `$PATH`.
for file in ~/.{exports,aliases,personal}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

