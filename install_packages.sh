#!/bin/bash
cd ~/dotfiles

repos=$(cat ./packages)

for repo in $repos
do
add-apt-repository $repo
done

apt update

packages=$(cat ./packages)

for pkg in $packages
do
apt install -y $pkg
done