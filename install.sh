#!/usr/bin/env bash

set -e

if [[ $(xcode-select --version) ]]; then
  echo Xcode command tools already installed
else
  echo "Installing Xcode commandline tools"
  xcode-select --install
fi

if [[ $(brew --version) ]] ; then
    echo "Attempting to update Homebrew"
    brew update
    brew upgrade
else
    echo "Attempting to install Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew tap aws/tap

brew install \
  git \
  jq \
  ansible \
  awscli \
  telnet \
  kubernetes-cli \
  httpie \
  asdf \
  helm \
  hugo \
  kubent \
  gh \
  eks-node-viewer \
  derailed/k9s/k9s

asdf plugin add python || true
asdf plugin add terraform || true
asdf plugin add poetry || true

asdf install python 3.11.7
asdf global python 3.11.7

asdf install python 3.7.17

asdf install poetry 1.7.1
asdf global poetry 1.7.1

asdf install terraform latest
asdf global terraform latest

exec -l $SHELL
