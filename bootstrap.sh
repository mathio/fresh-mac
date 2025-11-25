#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin main;

function doIt() {
	echo "Please enter your password to proceed:";
	# Ask for the administrator password upfront
	sudo -v
	
	# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
	while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE.md" \
		-avh --no-perms . ~;
	source ~/.bash_profile;
	
	# Configure macOS settings
	read -p "Enter the computer name you want to set: " computer_name
	bash ~/.macos "$computer_name"

	# Install software
	bash ~/.brew
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
	doIt;
fi;


unset doIt;

