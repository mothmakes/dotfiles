#!/bin/bash
cd ~/dotfiles

packages=$(cat ./pip_packages)

for pkg in $packages
do
pip install $pkg
done
