#!/bin/bash

for file in $(ls -Ad .*); do
    if [[ $file != .git && $file != .gitignore && $file != .gitmodules ]]; then
	ln -s $(realpath $file) ~/$file
    fi
done
