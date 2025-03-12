#!/bin/bash

for file in bashrc emacs git-prompt.sh Xresources zshrc fonts emacs.d config; do
    if [[ $file != .git && $file != .gitignore && $file != .gitmodules ]]; then
	ln -s $(realpath $file) ~/.$file
    fi
done
