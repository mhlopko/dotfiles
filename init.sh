#!/bin/bash

set -e

APT_PACKAGES=( neovim xstow tree zsh i3 )
BREW_PACKAGES=( neovim stow tree zsh )
CONFIGS_TO_BE_LINKED=( bin gdb git hg config )

if [[ "${OSTYPE}" = darwin* ]];
then
  if ! type brew &> /dev/null;
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  brew install ${BREW_PACKAGES}
elif [[ "${OSTYPE}" = "linux-gnu" ]];
then
  sudo apt-get install -y ${APT_PACKAGES}
else
  echo "OSTYPE not recognized: '${OSTYPE}'"
  exit 1
fi
echo "Done installing packages"

for package in "${CONFIGS_TO_BE_LINKED[@]}"
do
  stow -S $package
done
echo "Done symlinking"

echo "Tadaaa"
