#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

# update
git pull origin master

# if npm is installed, update npm completion
if type "npm" > /dev/null; then
	npm completion > ./.scripts/npm-completion.bash
fi

# if grunt-cli is installed, update grunt-completion
if type "grunt" > /dev/null; then
	grunt --completion=bash > ./.scripts/grunt-completion.bash
fi

# if gulp is installed, update grunt-completion
if type "gulp" > /dev/null; then
	gulp --completion=bash > ./.scripts/gulp-completion.bash
fi

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
