function fish_user_key_bindings
    fish_default_key_bindings
end

function rgrep
    grep -rn --color=auto "$argv" .
end

function allowport
    sudo iptables -A INPUT -p tcp --dport $argv -j ACCEPT
end

function startssh
    allowport 22
    sudo systemctl start sshd
    sudo iwconfig wlp2s0 power off
end

source ~/.config/fish/local.fish

alias gap "git add --patch ."

set PATH ~/.local/bin $PATH
set -x LS_COLORS "$LS_COLORS:ow=1;34:tw=1;34:"
set -x EDITOR /usr/bin/vim
