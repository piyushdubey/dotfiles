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

# Java development
brew install java

# PlantUML (PlantUML dependencies - java, graphviz, plantuml)
brew install graphviz
brew install plantuml

# Python development
brew install python3
brew install uv

# Ruby 
brew install ruby
brew install bundler

# Rust development
brew install rust

# Go development
brew install go

# IDEs and other guis
brew install --cask postman
brew install --cask quicklook-json
brew install --cask sequel-ace
brew install --cask visual-studio-code
brew install docker
brew install docker-compose
brew install kubectl

# Compilers, and clis.
brew install awscli
brew install azure-cli
brew install gcc
brew install protobuf
brew install gettext
brew install pkg-config
brew install supabase/tap/supabase
brew install s3cmd
brew install --cask google-cloud-sdk

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

# Photo editing
brew install --cask gimp

# Spotify
brew install --cask spotify

# Wacom + Inkscape
brew install --cask wacom-tablet
brew install --cask inkscape

# Tool chain
brew install --cask flux 
brew install --cask keepingyouawake 
brew install --cask rectangle
brew install --cask yubico-yubikey-manager 
brew install --cask maccy
brew install --cask vlc
brew install --cask sourcetree

brew install --cask yubico-authenticator
brew install --cask bitwarden

# Collaboration packages
brew install --cask discord 
brew install --cask slack
brew install --cask zoom
brew install --cask whatsapp
brew install --cask signal

# Stock/Options Trading packages
brew install --cask tradingview #India
brew install --cask webull #US

# Adobe Acrobat Reader
brew install --cask adobe-acrobat-reader

# 3D Printer Software
brew install --cask bambu-studio

npm i -g \
    aws-cdk
