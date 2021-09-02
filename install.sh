#!/bin/bash
set -e

exec > >(tee -i $HOME/.dotfiles_install.log)
exec 2>&1
set -x

if [ ! -s ~/.zshrc ]; then
  rm -rf ~/.zshrc && ln -s $dotfiles_root/.zshrc ~/.zshrc
fi
