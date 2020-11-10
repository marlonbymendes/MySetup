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

function trees
    tree -I "node_modules|dist|build|*.lock" .
end

function nodeclean
    rm -rf node_modules
		rm -rf node/node_modules
		rm -rf react/node_modules
    rm -rf *.lock
    rm -rf package-lock.json
end

source ~/.config/fish/heroku-autocomplete.fish

alias mvsc "python3 ~/repos/MySetup/move_latest_picture.py"
alias gdiff "git diff --unified=0 -- . ':(exclude)*.lock'"
alias gshow "git show --unified=0 -- . ':(exclude)*.lock'"
alias python "python3"

set -x GOPATH ~/go
set -x PATH $PATH /usr/local/go/bin $GOPATH/bin

# CP

alias ct "cp ~/cp/template/template.cpp ."

function cpy
	cat  "$argv[1] | xclip -selection c"
end

function cr
	mkdir  "$argv[1]"
	cd  "$argv[1]"
	ct
	mv template.cpp  "$argv[1].cpp"
#xdotool key ctrl+shift+t
#xdotool key ctrl+Page_Up
#xdotool key F11
	vim  "$argv[1].cpp"
end

function cmp
	set BIN_FILE "prog"
	g++  (find . -name '*.cpp') -o $BIN_FILE -Wshadow -Wall -fsanitize=address -fsanitize=undefined -std=c++17
end

function cf
    cd ~/cp/codeforces/
end

function cpy
	cat (find . -name '*.cpp') | pbcopy
end

function mkdirmetadata
	echo 'mkdirmetadata'
	pwd
	fish ~/repos/swe/fish/mkdirmetadata.fish
	echo 'done'
end

function codemkdir
	code ~/repos/swe/fish/mkdirmetadata.fish
end

function mtc
	python3 /Users/marlonguimaraes/repos/swe/py/metadata-converter/main.py (pwd)
end

function lt
	vtex local token
end

function lint
	yarn format
	yarn lint --fix
	yarn eslint ./src --cache --ext ts --fix --config .eslintrc
end

function dbranch
	git fetch -p && git branch -vv | awk '/: gone]/{print $1}' | xargs git branch -D
end
