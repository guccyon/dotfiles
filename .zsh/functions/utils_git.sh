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
