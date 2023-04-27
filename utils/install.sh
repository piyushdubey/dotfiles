#!/bin/sh

# Install things we need for local development.
printf '\nInstalling development packages...\n'

# Javascript development
brew install jq
brew install node
brew install nvm
brew install yarn
brew install htop
mkdir -p ~/.nvm

# Python development
brew install python3

# Go development
brew install go

# IDEs and other guis
brew install --cask mysql-shell
brew install --cask quicklook-json
brew install --cask sequel-ace
brew install --cask visual-studio-code
brew install --cask docker

# Compilers, and clis.
brew install awscli
brew install gcc
brew install gettext
brew install pkg-config
brew install supabase/tap/supabase
brew install s3cmd

brew link --force gettext

# Install things we use for collaboration and productivity.
printf '\nInstalling collaboration and productivity packages...\n'

# Browsers
brew install --cask firefox
brew install --cask google-chrome

# Productivity boosters
brew install speedtest-cli
brew install tree
brew install wget
brew install fig

## Productivity Tools

# Calibre
brew install --cask calibre

# Notion
brew install --cask notion

# Microsoft Office
brew install --cask microsoft-office

# Mega Sync
brew install --cask megasync

# Dropbox
brew install --cask dropbox

# Google Drive
brew install --cask google-drive

# Tool chain
brew install --cask flux 
brew install --cask keepingyouawake 
brew install --cask rectangle
brew install --cask yubico-yubikey-manager 
brew install --cask maccy
brew install --cask vlc
brew install --cask sourcetree

brew tap homebrew/cask-drivers
brew install --cask yubico-authenticator
brew install --cask bitwarden

# Collaboration packages
brew install --cask discord 
brew install --cask slack
brew install --cask zoom

npm i -g \
    aws-cdk
