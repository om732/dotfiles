#!/bin/sh

CURRENT_DIR=$(cd $(dirname $0) && pwd)

create_link() {
  DOT_FILE=$1

  if [ -L $DOT_FILE ]; then
    rm -f $DOT_FILE
  fi
  ln -s $CURRENT_DIR/$DOT_FILE
}

cd $CURRENT_DIR
git submodule init
git submodule update

cd ~/

if [ -d ".vim" ]; then
  rm -rf .vim
fi
cp -a $CURRENT_DIR/.vim .vim

if [ -f ".viminfo" ]; then
  rm -f .viminfo
fi
mkdir .viminfo

create_link .vimrc
create_link .tmux.conf
create_link .zshenv
create_link .zshrc
create_link .gitconfig
create_link .gitconfig-work
create_link .gitconfig-private
create_link .peco
create_link .config
