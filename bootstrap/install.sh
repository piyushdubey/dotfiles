#!/usr/bin/env bash
# =============================================================================
# bootstrap/install.sh — One-shot foundation: Homebrew, Oh My Zsh, Rosetta 2
# Idempotent: safe to re-run.
# =============================================================================

set -euo pipefail

# --- Homebrew ----------------------------------------------------------------
printf 'Checking for Homebrew...\n'
if ! command -v brew >/dev/null 2>&1; then
  printf 'Installing Homebrew...\n'
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Ensure brew is on PATH for the rest of this script.
  if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  fi
fi
printf '✅ Homebrew is installed.\n\n'

# --- Oh My Zsh ---------------------------------------------------------------
if [ -d "$HOME/.oh-my-zsh" ]; then
  printf '✅ Oh My Zsh already installed — skipping.\n\n'
else
  printf 'Installing Oh My Zsh...\n'
  # RUNZSH=no  → don't drop into a new zsh shell when done
  # KEEP_ZSHRC=yes → don't overwrite any existing ~/.zshrc (we manage it)
  RUNZSH=no KEEP_ZSHRC=yes \
    /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  printf '✅ Oh My Zsh installed.\n\n'
fi

# --- Rosetta 2 (Apple Silicon only) ------------------------------------------
if [ "$(uname -m)" = "arm64" ]; then
  if /usr/bin/pgrep -q oahd 2>/dev/null; then
    printf '✅ Rosetta 2 already installed — skipping.\n'
  else
    printf 'Installing Rosetta 2...\n'
    sudo softwareupdate --install-rosetta --agree-to-license
    printf '✅ Rosetta 2 installed.\n'
  fi
else
  printf '↪︎  Intel Mac — Rosetta 2 not needed.\n'
fi
