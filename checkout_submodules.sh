#!/bin/bash

#Initialise gitmodules
declare -a submodules=$(grep path .gitmodules | sed 's/.*= //')

git submodule init
git submodule update

for submodule in $submodules; do
	echo Submodule: $submodule
	pwd
	ls -al roles/
	cd $submodule
	git checkout master
	cd ../../
done;
