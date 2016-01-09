function gitbr () {
  git fetch origin
  git co -b "$1" origin/master
  git subup
  xcode
}

function gitgc () {
  git remote prune origin
  git gc
}

function gitcoo () {
  git fetch origin
  git co "origin/$1"
  git subup
  xcode
}

function gitrm-submodule() {
  if [ $1 ]; then
    git submodule deinit $1
    git rm $1
    git config -f .gitmodules --remove-section submodule.$1
  else
    echo 'target is not found'
  fi
}
