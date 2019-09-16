# UTILITY FUNCTIONS
function rgrep
    grep -rn --color=auto "$argv" .
end

function accept-port
    sudo iptables -A INPUT -p tcp --dport $argv -j ACCEPT
end

function start-ssh
    allowport 22
    sudo systemctl start sshd
    sudo iwconfig wlp2s0 power off
end

alias count-lines "wc -l"
alias count-bytes "wc -c"
alias count-chars "wc -m"
alias count-words "wc -w"
alias gap "git add --patch ."
alias listen-port "nc -lvp"

# LOCAL SCRIPT
source ~/.config/fish/local.fish

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
    set_color white; echo -ns $USER @ (prompt_hostname) " "
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
