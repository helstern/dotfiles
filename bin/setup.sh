#!/usr/bin/env bash

#inspired by https://github.com/mathiasbynens/dotfiles.git

#find the root dir (relative to the one this script is located in) and make it the working dir
ROOT_DIR='';
if [ -z type realpath >/dev/null 2>&1 ]; then
    ROOT_DIR=$(dirname "$(dirname $(realpath "${BASH_SOURCE}"))")
else
    ROOT_DIR=$(dirname "$(dirname $(readlink -f "${BASH_SOURCE}"))")
fi
cd "$ROOT_DIR"

#update the repository
git pull origin master

function install() {
    rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bin/" --exclude "README.md" \
        -av --no-perms \
        . ~
    source ~/.bash_profile
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
    install
else
    read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        install
    fi
fi
unset install
