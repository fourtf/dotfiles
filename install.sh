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

# create the containing folder and then link a file
link() {
    mkdir -p $(dirname $2)
    ln -sf $1 $2
}

sudo_link() {
    sudo mkdir -p $(dirname $2)
    sudo ln -sf $1 $2
}

echo Sym-linking will override existing files!

# questions
if confirm "Install VundleVim"; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

confirm "Link vimrc"                &&      link "$(pwd)/vimrc"            "$HOME/.vimrc"
confirm "Link gvimrc"               &&      link "$(pwd)/gvimrc"           "$HOME/.gvimrc"
confirm "Link bashrc"               &&      link "$(pwd)/bashrc"           "$HOME/.bashrc"
confirm "Link alacritty config"     &&      link "$(pwd)/alacritty.yml"    "$HOME/.config/alacritty/alacritty.yml"
confirm "Link i3 config"            &&      link "$(pwd)/i3"               "$HOME/.config/i3/config"
confirm "Link i3status config"      &&      link "$(pwd)/i3status"         "$HOME/.config/i3status/config"
confirm "Link fish config"          &&      link "$(pwd)/config.fish"      "$HOME/.config/fish/config.fish"
confirm "Link fishfile"             &&      link "$(pwd)/fishfile"         "$HOME/.config/fish/fishfile"
confirm "Link gtk-3.0 css file"     &&      link "$(pwd)/gtk-3.0.css"      "$HOME/.config/gtk-3.0/gtk.css"
confirm "Link xorg touchpad config" && sudo_link "$(pwd)/90-touchpad.conf" "/etc/X11/xorg.conf.d/90-touchpad.conf"
confirm "Link xorg keyboard config" && sudo_link "$(pwd)/00-keyboard.conf" "/etc/X11/xorg.conf.d/00-keyboard.conf"
confirm "Link lock application"     && sudo_link "$(pwd)/lock"             "/usr/local/bin/lock"
confirm "Link randzig"              && sudo_ink "$(pwd)/randzig"          "/usr/local/bin/randzig"
confirm "Persist webcam config"     && cd "$(pwd)/v4l2-persistent-settings/" && sudo make install

