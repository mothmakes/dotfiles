#!/bin/bash

# fzf

cd ~/
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# starship

curl -sS https://starship.rs/install.sh | sh

# zoxide

curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

# tailscale

curl -fsSL https://tailscale.com/install.sh | sh

# workman

cd /usr/share/X11/xkb/symbols
wget https://raw.githubusercontent.com/workman-layout/Workman/master/xorg/workman &&
setxkbmap -v workman && xset r 66 &&
setxkbmap us; xset -r 66
cd ~/

# zotero

mkdir -p ~/.local/bin/zotero
cd ~/.local/bin/zotero
wget "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64" -O zotero.tar.gz
tar –xvf zotero.tar.gz
rm zotero.tar.gz
cd Zotero_linux-x86_64
./set_launcher_icon
ln -s ~/.local/bin/zotero/Zotero_linux-x86_64/zotero.desktop ~/.local/share/applications/zotero.desktop

# tpm

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm