#!/bin/sh
# =============================================================================
# install.sh — Mac development environment setup
# Run via: make installers
# =============================================================================

set -e

brew update

# =============================================================================
# SECTION 1: SHELL & SYSTEM UTILITIES
# Lightweight CLI tools used daily in the terminal
# =============================================================================
printf '\n[1/7] Installing shell & system utilities...\n'

brew install gh           # GitHub CLI
brew install jq           # JSON processor
brew install htop         # Process viewer
brew install tree         # Directory listing
brew install wget         # File downloader
brew install ripgrep      # Fast file search (rg)
brew install uv           # Fast Python package manager


# =============================================================================
# SECTION 2: RUNTIMES & LANGUAGES
# Language runtimes — managed via Homebrew
# =============================================================================
printf '\n[2/7] Installing runtimes & languages...\n'

# JavaScript
brew install node
brew install nvm
brew install yarn
mkdir -p ~/.nvm

# Java
brew install openjdk
brew install maven

# Python
brew install python3

# Ruby (keg-only — add /opt/homebrew/opt/ruby/bin to PATH)
brew install ruby

# Rust
brew install rust

# Go
brew install go


# =============================================================================
# SECTION 3: DEVOPS & CLOUD
# Containers, orchestration, and cloud provider CLIs
# =============================================================================
printf '\n[3/7] Installing DevOps & cloud tools...\n'

brew install docker
brew install docker-compose
brew install kubectl
brew install awscli
brew install azure-cli
brew install s3cmd
brew install supabase/tap/supabase
brew install --cask google-cloud-sdk


# =============================================================================
# SECTION 4: AI & LOCAL MODELS
# AI coding assistants and local LLM tooling
# =============================================================================
printf '\n[4/7] Installing AI tools...\n'

brew install --cask lm-studio    # Local LLM runner (GUI)
# Note: ollama available via `brew install ollama` — start manually with `ollama serve`


# =============================================================================
# SECTION 5: DEVELOPMENT APPS
# IDEs, API clients, and developer GUI tools
# =============================================================================
printf '\n[5/7] Installing development apps...\n'

brew install --cask visual-studio-code
brew install --cask cursor           # AI-first code editor
brew install --cask iterm2           # Terminal emulator
brew install --cask bruno            # API client (Postman alternative)
brew install --cask sourcetree       # Git GUI
brew install --cask google-chrome    # Browser


# =============================================================================
# SECTION 6: PRODUCTIVITY & LIFESTYLE
# Apps for daily work, communication, finance, and creative work
# =============================================================================
printf '\n[6/7] Installing productivity & lifestyle apps...\n'

# Notes & knowledge
brew install --cask obsidian         # Markdown knowledge base
brew install --cask notion           # Docs & wikis

# Office & files
brew install --cask microsoft-office
brew install --cask google-drive
brew install --cask calibre          # eBook manager

# Communication
brew install --cask slack
brew install --cask discord
brew install --cask zoom
brew install --cask whatsapp
brew install --cask signal

# Finance & trading
brew install --cask tradingview
brew install --cask webull

# Media
brew install --cask spotify
brew install --cask vlc

# Design & creative
brew install --cask gimp
brew install --cask inkscape
brew install --cask bambu-studio     # 3D printer slicer


# =============================================================================
# SECTION 7: MAC SYSTEM UTILITIES
# Menu bar tools, security, and quality-of-life improvements
# =============================================================================
printf '\n[7/7] Installing Mac utilities...\n'

brew install --cask rectangle        # Window manager
brew install --cask maccy            # Clipboard history
brew install --cask keepingyouawake  # Prevent sleep
brew install --cask flux             # Blue light filter
brew install --cask bitwarden        # Password manager
brew install --cask yubico-authenticator  # YubiKey manager


# =============================================================================
# GLOBAL NPM PACKAGES
# =============================================================================
printf '\nInstalling global npm packages...\n'

npm i -g aws-cdk
npm i -g @anthropic-ai/claude-code

printf '\n✅ Installation complete. Restart your shell.\n'
