#!/bin/bash

function command_exists {
  command -v "$1" > /dev/null;
}

if ! command_exists brew ; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  (echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> /Users/hiroki/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew doctor
  brew update
  brew upgrade --cleanup
  brew -v
fi

if ! command_exists git ; then
  brew install git
  git --version
fi

if [ ! -d ./mac-setup ]; then
  git clone https://github.com/nomotohiroki/mac-setup.git
fi

/bin/bash ./mac-setup/setup.sh
