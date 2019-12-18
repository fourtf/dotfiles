#!/usr/bin/env bash

# cd to directory of this file
cd "$(dirname "$0")"

# promt user for confirmation, from https://stackoverflow.com/questions/3231804/in-bash-how-to-add-are-you-sure-y-n-to-any-command-or-alias
confirm() {
    read -r -p "$1? [y/N] " response

    if [[ $response =~ ^[yY]$ ]]; then
        true
    else
        false
    fi
}

echo Sym-linking will override existing files!

# questions
if confirm "Install VundleVim"; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

confirm "Link vimrc"                &&      ln -sf "$(pwd)/vimrc"           "$HOME/.vimrc"
confirm "Link gvimrc"               &&      ln -sf "$(pwd)/gvimrc"          "$HOME/.gvimrc"
confirm "Link bashrc"               &&      ln -sf "$(pwd)/bashrc"          "$HOME/.bashrc"
confirm "Link alacritty config"     &&      ln -sf "$(pwd)/alacritty.yml"    "$HOME/.config/alacritty/alacritty.yml"
confirm "Link i3 config"            &&      ln -sf "$(pwd)/i3"               "$HOME/.config/i3/config"
confirm "Link i3status config"      &&      ln -sf "$(pwd)/i3status"         "$HOME/.config/i3status/config"
confirm "Link fish config"          &&      ln -sf "$(pwd)/config.fish"      "$HOME/.config/fish/config.fish"
confirm "Link fishfile"             &&      ln -sf "$(pwd)/fishfile"         "$HOME/.config/fish/fishfile"
confirm "Link xorg touchpad config" && sudo ln -sf "$(pwd)/90-touchpad.conf" "/etc/X11/xorg.conf.d/90-touchpad.conf"
