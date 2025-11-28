#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE.md" \
		--exclude "SETUP.md" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
	
	echo "Next steps:";
	echo "  Apply settings: bash ~/.macos new_computer_name"
	echo "  Install software: bash ~/.brew"
	echo "  Setup ssh-agent: bash ~/.ssh-setup"
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	doIt;
fi;


unset doIt;

