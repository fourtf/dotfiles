function fish_user_key_bindings
    fish_default_key_bindings
end

function rgrep
    grep -rn --color=auto "$argv" .
end

function allowport
    sudo iptables -A INPUT -p tcp --dport $argv -j ACCEPT
end

set -x INCLUDEOS_PREFIX ~/includeos/
set PATH ~/includeos/bin ~/.local/bin $PATH
set -x ALGO /c/Users/danie/workspace_hska
set -x LS_COLORS "$LS_COLORS:ow=1;34:tw=1;34:"
