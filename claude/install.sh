#!/usr/bin/env bash
# =============================================================================
# claude/install.sh — Symlink Claude Code config into ~/.claude/
# Run via: make claude
#
# Manages individual files under ~/.claude/ (not the whole directory, since
# Claude itself writes session/cache/etc. data there).
# =============================================================================

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${HOME}/.claude"

mkdir -p "${TARGET_DIR}"

link_file() {
  local src="$1"
  local dest="$2"

  if [ ! -e "${src}" ]; then
    return 0
  fi

  # If dest is already the right symlink, skip.
  if [ -L "${dest}" ] && [ "$(readlink "${dest}")" = "${src}" ]; then
    printf '  ✓ %s (already linked)\n' "${dest}"
    return 0
  fi

  # Back up an existing regular file so nothing gets silently overwritten.
  if [ -e "${dest}" ] && [ ! -L "${dest}" ]; then
    local backup="${dest}.bak.$(date +%Y%m%d%H%M%S)"
    mv "${dest}" "${backup}"
    printf '  ↩  Backed up existing %s → %s\n' "${dest}" "${backup}"
  fi

  ln -sfn "${src}" "${dest}"
  printf '  → %s -> %s\n' "${dest}" "${src}"
}

printf 'Linking Claude Code config into %s\n' "${TARGET_DIR}"
link_file "${SCRIPT_DIR}/settings.json" "${TARGET_DIR}/settings.json"

# Optional user-level instructions. Only links if you create claude/CLAUDE.md.
link_file "${SCRIPT_DIR}/CLAUDE.md" "${TARGET_DIR}/CLAUDE.md"

printf '✅  Claude Code config linked.\n'
