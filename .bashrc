### Personal

mkcd () {
  mkdir "$1"
    cd "$1"
}

alias docker="sudo docker"
alias docker-compose="sudo docker-compose"

### Python
export ENV_DIR=$HOME/virtualenvs/

function mkenv() {
    python3 -m venv $ENV_DIR/$1
}

function shenv() {
    source $ENV_DIR/$1/bin/activate
}

function rmenv() {
    sudo rm -rf $ENV_DIR/$1
}
