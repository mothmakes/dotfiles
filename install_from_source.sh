#!/bin/bash
cd ~/.local/ 
mkdir bin
# llvm

bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

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
cd ~/.tmux/plugins/tpm/bin/ 
./install_plugins
cd ~/dotfiles/

# NVChad

git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# Godot
cd ~/.local/bin 
mkdir Godot
cd Godot
wget $(lastversion godot --assets --filter x86_64 | head -n 1)
lv_godot=$(lastversion godot)
gd_name="Godot_v$lv_godot-stable_linux.x86_64"
unzip "$gd_name.zip"
ln -s ./$gd_name "./godot.x86_64"
rm "$gd_name.zip"

# Obsidian
cd ~/.local/bin/ 
mkdir Obsidian
cd Obsidian
wget $(lastversion https://github.com/obsidianmd/obsidian-releases --assets --filter AppImage | tail -n 1)
