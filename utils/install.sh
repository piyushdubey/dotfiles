#!/usr/bin/env bash
# =============================================================================
# utils/install.sh — Mac development environment setup
# Run via: make installers
#
# Packages are declared in utils/Brewfile so installs are idempotent, parallel,
# and re-runnable. Edit that file to add/remove packages.
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BREWFILE="${SCRIPT_DIR}/Brewfile"

if ! command -v brew >/dev/null 2>&1; then
  echo "❌ Homebrew not installed. Run 'make bootstrap' first." >&2
  exit 1
fi

printf '\n📦  Updating Homebrew...\n'
brew update

printf '\n📦  Installing packages from Brewfile...\n'
brew bundle --file="${BREWFILE}"

# ~/.nvm directory must exist before nvm can install Node versions
mkdir -p "$HOME/.nvm"

# --- Global npm packages -----------------------------------------------------
# Source nvm so `npm` is on PATH inside this script.
export NVM_DIR="$HOME/.nvm"
if [ -s "/opt/homebrew/opt/nvm/nvm.sh" ]; then
  # shellcheck disable=SC1091
  . "/opt/homebrew/opt/nvm/nvm.sh"
fi

if command -v npm >/dev/null 2>&1; then
  printf '\n📦  Installing global npm packages...\n'
  npm i -g aws-cdk @anthropic-ai/claude-code
else
  printf '\n⚠️   npm not on PATH yet — install a Node version with `nvm install --lts`, then re-run.\n'
fi

printf '\n✅  Installation complete. Restart your shell.\n'
