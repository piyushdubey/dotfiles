# CLAUDE.md

Guidance for Claude Code (claude.ai/code) working in this repo.

## Overview

A Mac dotfiles repo. `Makefile` is the primary entry point; configuration is
managed via symlinks, a `Brewfile`, and a few install scripts.

## Common commands

```sh
make help          # List all available targets
make all           # Full setup: bootstrap + dotfiles + installers + claude + dnsmasq
make bootstrap     # Homebrew, Oh My Zsh, iTerm2, Rosetta 2
make dotfiles      # Symlink all *.symlink files into $HOME
make installers    # brew bundle on utils/Brewfile + global npm packages
make claude        # Symlink Claude Code config into ~/.claude/
make dnsmasq       # Configure dnsmasq for .docker host routing
make clean         # Remove all symlinks created by this repo
```

Each install script is idempotent — re-running is safe.

## Architecture

### Flat symlink convention
Any file named `*.symlink` is linked into `$HOME` with the `.symlink` suffix
stripped. Example: `zsh/.zshrc.symlink` → `~/.zshrc`. This is flat — files
land directly in `$HOME`. Anything that belongs under a subdirectory of
`$HOME` (like `~/.claude/`) is handled by a dedicated `install.sh` per
directory.

### Per-directory install scripts
Directories that need richer setup ship their own `install.sh`:
- `bootstrap/install.sh` — Homebrew, Oh My Zsh, Rosetta 2 (run by `make bootstrap`)
- `utils/install.sh` — runs `brew bundle` against `utils/Brewfile` + global npm packages
- `claude/install.sh` — symlinks individual files into `~/.claude/` (not the whole dir; Claude writes session data there)

### Directory layout
- `bootstrap/` — foundation deps
- `utils/Brewfile` — declarative package list (edit this to add/remove apps)
- `utils/install.sh` — runs `brew bundle`
- `zsh/` — zshrc, p10k theme, oh-my-zsh customs (lazy-loaded NVM, aliases)
- `git/` — gitconfig + gitignore
- `dnsmasq/` — `*.docker` → localhost routing
- `claude/` — Claude Code config (`settings.json`, optional user `CLAUDE.md`)

### Shell setup notes
- Theme: Powerlevel10k
- NVM is lazy-loaded via `zsh/.oh-my-zsh/custom/nvm.zsh` (saves ~300ms on shell startup)
- `fpath` is extended **before** `source $ZSH/oh-my-zsh.sh` so `~/.zfunctions` is visible to `compinit`

### Adding a new package
Edit `utils/Brewfile` and run `make installers`. `brew bundle` is idempotent;
already-installed packages are skipped.

### Adding a new dotfile that goes in `$HOME`
Drop it into any subdirectory with the `.symlink` suffix and run `make dotfiles`.

### Adding a new dotfile under `~/.claude/`
Place it under `claude/` and reference it from `claude/install.sh`. Run `make claude`.
