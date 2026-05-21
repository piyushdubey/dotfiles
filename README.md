# dotfiles

Opinionated Mac developer setup — Homebrew packages, zsh with Powerlevel10k,
git config, Claude Code config, and dnsmasq routing for `*.docker` hosts.

## Quick start

```sh
git clone https://github.com/<you>/dotfiles ~/projects/dotfiles
cd ~/projects/dotfiles
make all
```

Then restart your shell.

## What `make all` does

| step          | what it installs                                                       |
|---------------|------------------------------------------------------------------------|
| `bootstrap`   | Homebrew, Oh My Zsh, iTerm2, Rosetta 2 (Apple Silicon)                 |
| `dotfiles`    | Symlinks every `*.symlink` file into `$HOME`                           |
| `installers`  | `brew bundle` against `utils/Brewfile` + global npm packages           |
| `claude`      | Symlinks Claude Code config into `~/.claude/`                          |
| `dnsmasq`     | Routes `*.docker` hostnames to localhost                               |

Run `make help` to see all targets. Each is idempotent — safe to re-run.

## Customizing

- **Add a Mac app or CLI:** edit `utils/Brewfile`, then `make installers`.
- **Add a dotfile to `$HOME`:** create `*.symlink` anywhere in the repo, then `make dotfiles`.
- **Tweak Claude Code:** edit `claude/settings.json`, then `make claude`.
- **Local git config (machine-specific):** put it in `~/.gitconfig.local` —
  it's already `[include]`-ed from the tracked gitconfig.

## Layout

```
bootstrap/   foundation deps (idempotent)
utils/       Brewfile + installer
zsh/         zshrc, p10k, oh-my-zsh customs
git/         gitconfig, gitignore
claude/      Claude Code settings
dnsmasq/     *.docker → 127.0.0.1
```

See `CLAUDE.md` for the architecture notes that drive Claude Code when it
works on this repo.
