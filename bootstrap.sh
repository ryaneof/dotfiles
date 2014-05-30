#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

# update
git pull origin master

# get git-completion script from git repo on github.
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ./.scripts/git-completion.bash

function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" \
		--exclude "readme.md" -avh --no-perms . ~
	source ~/.bash_profile
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
