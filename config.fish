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

set -x INCLUDEOS_PREFIX ~/includeos/
set PATH ~/.nimble/bin ~/includeos/bin ~/.local/bin /etc/dotfiles/bin $PATH
set -x ALGO /c/Users/danie/workspace_hska
set -x LS_COLORS "$LS_COLORS:ow=1;34:tw=1;34:"
set -x ANDROID_HOME /opt/android-sdk
set -x JAVA_OPTS "-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee"
set -x ENABLE_FLUTTER_DESKTOP true
set -x EDITOR /usr/bin/vim
