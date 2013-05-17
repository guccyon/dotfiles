#!/bin/sh

dir=$(cd $(dirname $0) && pwd)
dotfiles=`ls -a $dir|grep "^\.[^.]"`
excepts=(.git)
IFS=$'\n'


targets=(${dotfiles[*]} ${excepts[*]} ${excepts[*]})
targets=(`echo "${targets[*]}" | sort | uniq -u`)

for i in ${targets[@]}; do
  echo $HOME/$i
  if [ -e $HOME/$i ];then
    if [ ! -e ~/.org ];then
      mkdir ~/.org
    fi
    mv $HOME/$i $HOME/.org/
  fi

  ln -s $dir/$i $HOME/$i
done


