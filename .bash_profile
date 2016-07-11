source ~/.nvm

export ELECTRON_MIRROR=http://npm.taobao.org/mirrors/electron/

export NVM_DIR="/Users/noyobo/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# alias list

## 快速查看本机IP地址
function myip(){
  myip="$(ifconfig | grep 'inet.*netmask.*broadcast')"
  lanip="$(echo $myip | awk '{print $2}')"
  publicip="$(echo $myip | awk '{print $6}')"
  echo '你的局域网IP是: '$lanip
  echo '你的外网IP是: '$publicip
  echo '复制到剪贴板' $lanip | pbcopy
}

# server current directory

function httpd-server() {
  PORT=${1:-8000}
  open "http://localhost:$PORT"
  python -m SimpleHTTPServer $PORT
}

alias sv='httpd-server'

# php server current directory

function php-server() {
  PORT=${1:-8000}
  open "http://localhost:$PORT"
  php -S 127.0.0.1:$PORT -t ./
}

alias pv='php-server'

function tnpm-publish-patch(){
  VERSION=${1:-patch}
  git push origin $(git rev-parse --abbrev-ref HEAD)
  git push origin $(tnpm version $VERSION)
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
alias gnm="git merge --no-ff"
