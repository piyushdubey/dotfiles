#!/bin/sh

# Install development tools and applications via Homebrew.
printf '\nInstalling development packages...\n'

# Core CLI tools
brew install jq
brew install htop
brew install tree
brew install wget
brew install ripgrep
brew install uv

# Javascript
brew install node
brew install nvm
brew install yarn
mkdir -p ~/.nvm

# Java
brew install openjdk
brew install maven

# Python
brew install python3

# Ruby
brew install ruby

# Rust
brew install rust

# Go
brew install go

# Docker
brew install docker
brew install docker-compose
brew install kubectl

# Cloud CLIs
brew install awscli
brew install azure-cli
brew install s3cmd
brew install supabase/tap/supabase
brew install --cask google-cloud-sdk

# GUI applications
printf '\nInstalling applications...\n'

# IDEs & dev tools
brew install --cask visual-studio-code
brew install --cask bruno
brew install --cask sourcetree

# Browsers
brew install --cask google-chrome

# Productivity
brew install --cask notion
brew install --cask microsoft-office
brew install --cask google-drive
brew install --cask calibre
brew install --cask spotify

# Utilities
brew install --cask flux
brew install --cask keepingyouawake
brew install --cask rectangle
brew install --cask maccy
brew install --cask vlc
brew install --cask bitwarden
brew install --cask yubico-authenticator
brew install --cask iterm2

# Design & media
brew install --cask gimp
brew install --cask inkscape
brew install --cask bambu-studio

# Notes & knowledge base
brew install --cask obsidian

# Communication
brew install --cask discord
brew install --cask slack
brew install --cask zoom
brew install --cask whatsapp
brew install --cask signal

# Finance
brew install --cask tradingview
brew install --cask webull

# Global npm packages
npm i -g aws-cdk
npm i -g @anthropic-ai/claude-code
