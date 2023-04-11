#!/bin/sh

# Install things we need for local development.
printf '\nInstalling development packages...\n'

# Javascript development
brew install \
    jq \
    node \
    nvm \
    yarn \
    htop
mkdir -p ~/.nvm

#Python development
brew install \
    python3 \
    

# IDEs and other guis
brew install --cask \
    mysql-shell \
    quicklook-json \
    sequel-ace \
    visual-studio-code

brew install --cask \
    docker

# Compilers, and clis.
brew install \
    awscli \
    gcc \
    gettext \
    pkg-config \
    supabase \
    s3cmd
brew link --force gettext

# Install things we use for collaboration and productivity.
printf '\nInstalling collaboration and productivity packages...\n'

# Browsers
brew install --cask \
    firefox \
    google-chrome

# Productivity boosters
brew install \
    speedtest-cli \
    tree \
    wget

# Tool chain
brew install --cask \
    calibre \
    flux \
    keepingyouawake \
    spectacle \
    yubico-yubikey-manager

brew tap homebrew/cask-drivers
brew install --cask yubico-authenticator
brew install --cask bitwarden

# Collaboration packages
brew install --cask \
    discord \
    slack \
    zoom

npm i -g \
    aws-cdk
