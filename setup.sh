#!/bin/bash

if [ ! -d "${HOME}/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  "${HOME}/.oh-my-zsh/tools/upgrade.sh"
fi

if [ -a "${HOME}/.nix-profile/bin/nix-env" ]; then
  "${HOME}/.nix-profile/bin/nix-env" -iA nixpkgs.diff-so-fancy
fi

git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
