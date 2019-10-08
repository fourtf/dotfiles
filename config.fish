# VARIABLES
set LOCAL_CONFIG ~/.config/fish/local.fish
set SHARED_CONFIG (status --current-filename)

# HELPER FUNCTIONS
function _default -a value default
    if test "$value" = ""
        echo "$default"
    else
        echo "$value"
    end
end

# UTILITY FUNCTIONS
function rgrep
    grep -rn --color=auto "$argv" .
end

function accept-port
    sudo iptables -A INPUT -p tcp --dport $argv -j ACCEPT
end

function start-ssh
    accept-port 22
    sudo systemctl start sshd
    sudo iwconfig wlp2s0 power off
end

function cat-all -a pattern -d "Concats all file contents recursively. Ignores .git directory."
    find . -regextype sed -regex (_default "$pattern" ".*") -type f -not -path "*/.git/*" -exec cat "{}" \;
end

alias :w "echo the terminal has been saved"
alias bake "bear make -j4"
alias count-bytes "wc -c"
alias count-chars "wc -m"
alias count-lines "wc -l"
alias count-words "wc -w"
alias edit-config "$EDITOR $SHARED_CONFIG"
alias edit-localconfig "$EDITOR $LOCAL_CONFIG"
alias gap "git add --patch ."
alias listen-port "nc -lvp"
alias make "make -j4"
alias make5 "make -j4 CFLAGS=\"-fmax-errors=5\""
alias new-bash "echo \#!/usr/bin/env sh >"
alias new-sh "echo \#!/usr/bin/env sh >"
alias source-config "source $SHARED_CONFIG"
alias source-localconfig "source $LOCAL_CONFIG"

# LOAD LOCAL CONFIG
source-localconfig

# FISH CONFIG
function print_git_branch
    set p $argv[1]
    if test (string length $p) != 1; and test -d $p
        if test -d $p/.git 
            echo -sn " "(sed -e "s_^.\+/__" $p/.git/HEAD 2> /dev/null | string sub -s 1 -l 8)
        else
            print_git_branch (dirname $p)
        end
    end
end

function fish_prompt
    set_color white; echo -ns $USER @ (prompt_hostname | string sub -s 1 -l 8) " "
    set_color green; echo -sn (prompt_pwd | string trim)
    set_color red;   print_git_branch (pwd) " "
    set_color white; echo -sn "> "
end

function fish_user_key_bindings
    fish_default_key_bindings
end

# ENVIRONMENT VARIABLES
set PATH ~/.local/bin $PATH
set -x LS_COLORS "$LS_COLORS:ow=1;34:tw=1;34:"
set -x EDITOR /usr/bin/vim
