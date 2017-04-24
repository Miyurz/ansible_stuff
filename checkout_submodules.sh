#!/bin/bash

#Initialise gitmodules
declare -a submodules=$(grep path .gitmodules | sed 's/.*= //')

git submodule init
git submodule update

for submodule in $submodules; do
	echo Submodule: $submodule
	cd $submodule
	git checkout master
	cd ../
done;
