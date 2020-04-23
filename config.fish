set -x -g LS_COLORS "di=38;5;27:fi=38;5;7:ln=38;5;51:pi=40;38;5;11:so=38;5;13:or=38;5;197:mi=38;5;161:ex=38;5;9:"

set -x -g TERM "xterm-256color"

set -x -g LC_ALL en_US.UTF-8
set -x -g LANG en_US.UTF-8

# Yarn
set -x -g PATH (yarn global bin) $PATH

function rc
    vim ~/.config/fish/config.fish
end

function src
    source ~/.config/fish/config.fish
end

function mkcd
    mkdir $argv
    cd $argv
end

function ts
    tsc --lib ES2015 --types node $argv.ts
    node $argv.js
end

function poweroff
    sudo shutdown -h now
end

function coderc
    cd ~/Library/Application\ Support/Code/User/
end

function swe
    cd ~/repos/swe
end

function movieme
    cd ~/repos/movieme
end

source ~/.config/fish/heroku-autocomplete.fish

alias mvsc "python3 ~/repos/MySetup/move_latest_picture.py"
alias gdiff "git diff --unified=0 -- . ':(exclude)*.lock' ':(exclude)*package.json'"
alias gshow "git diff --unified=0 -- . ':(exclude)*.lock' ':(exclude)*package.json'"
alias python "python3"

set -x GOPATH ~/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin
