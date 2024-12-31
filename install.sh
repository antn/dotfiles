#!/bin/bash
set -e

exec > >(tee -i $HOME/.dotfiles_install.log)
exec 2>&1
set -x

dotfiles_root=$(pwd)

# delete existing `.zshrc` if it exists
if [[ -n "${HOME}/.zshrc" ]]; then
  rm -rf ~/.zshrc
fi

ln -s $dotfiles_root/.zshrc ~/.zshrc

sudo chsh "$(id -un)" --shell "/usr/bin/zsh"

script/install-vscode-extensions
