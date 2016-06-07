source ~/.nvm

export NVM_DIR="/Users/noyobo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# alias list

# server current directory

function httpd-server() {
  PORT=${1:-8000}
  open "http://localhost:$PORT"
  python -m SimpleHTTPServer $PORT
}

alias sv='httpd-server'

function tnpm-publish-patch(){
  git push origin $(git rev-parse --abbrev-ref HEAD)
  git push origin $(tnpm version patch)
  tnpm publish
  git push origin $(git rev-parse --abbrev-ref HEAD)
}

alias tpp='tnpm-publish-patch'
alias ss='subl ./ -a'

function mkdcd () {
  mkdir "$1" && cd "$1"
}

alias mcd='mkdcd'

# git
alias gcorig="git status | grep '.orig' | cut -d ' ' -f 2- | xargs rm -f"
alias gbdd="git checkout master && git branch -l | sed 's/* master//' > /tmp/gitlocal.txt && git branch -r  | sed 's/origin\///' > /tmp/gitremote.txt && grep -Fxv -f /tmp/gitremote.txt /tmp/gitlocal.txt | xargs git branch -d"
