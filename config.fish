# VARIABLES
set LOCAL_CONFIG ~/.config/fish/local.fish
set SHARED_CONFIG (status --current-filename)
set DOTFILE_DIR (dirname (readlink -f (status --current-filename)))

# HELPER FUNCTIONS
function _default -a value default
    if test "$value" = ""
        echo "$default"
    else
        echo "$value"
    end
end

# UTILITY FUNCTIONS
function find-file
    fzf -0 -1 --preview='head -\$LINES {}' --preview-window=down
end

function find-files
    fzf -0 -1 --preview='head -\$LINES {}' --preview-window=down -m
end

function find-files-or-directories
    find . | fzf -0 -1 --preview='head -\$LINES {}' --preview-window=down -m
end

function rgrep
    grep -rn --color=auto --exclude-dir=node_modules $argv .
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

function new-script -a app -a path
    if test -e $path
        echo already exists
    else
        echo \#!/usr/bin/env $app > $path
        sudo chmod +x $path
        vim $path
    end
end

function 0x0 -a path
    if test -z $path
        set path (find-file)
    end

    curl -F"file=@$path" http://0x0.st
end

alias :w "echo \"/dev/tty\" [New] 0L, 0C written"
alias allow-port accept-port
alias bake "bear make -j4"
alias clip "xclip -selection c"
alias count-bytes "wc -c"
alias count-chars "wc -m"
alias count-lines "wc -l"
alias count-words "wc -w"
alias edit-config "eval \"\$EDITOR $SHARED_CONFIG; source-config\""
alias edit-localconfig "eval \"$EDITOR $LOCAL_CONFIG; source-localconfig\""
alias feh "feh --version-sort"
alias gap "git add --patch"
alias katze cat
alias listen-port "nc -lvp"
alias make "make -j4"
alias make5 "make -j4 CFLAGS=\"-fmax-errors=5\""
alias new-bash "new-script bash"
alias open-port accept-port
alias pacs "eval \"pacman -Slq | fzf -m --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S\""
alias source-config "source $SHARED_CONFIG"
alias source-localconfig "source $LOCAL_CONFIG"
alias yays "eval \"yay -Slq | fzf -m --preview 'yay -Si {1}' | xargs -ro yay -S\""
alias gits "eval \"begin; git diff --name-only --relative .; git ls-files --others --exclude-standard; end | fzf -m --preview 'git diff {1}' | xargs git add\""
alias gitsrm "eval \"begin; git diff --name-only --relative .; git ls-files --others --exclude-standard; end | fzf -m --preview 'git diff {1}' | xargs rm\""

# Function for i3
function set-ws -a nr -a name
    if test -z "$nr"
        echo 'set workspace nr $0 to name $0:$1'
    else
        i3-msg rename workspace "\""(i3-msg -t get_workspaces | jq -r ".[] | select(.num==$nr).name")"\"" to "$nr:$name"
    end
end

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
set PATH ~/.local/bin $PATH $DOTFILE_DIR/bin
set -x LS_COLORS "$LS_COLORS:ow=1;34:tw=1;34:"
set -x EDITOR /usr/bin/vim
