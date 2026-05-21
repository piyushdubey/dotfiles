# Set a default target.
.DEFAULT_GOAL := help

# Build variables.
PREFIX ?= $(PWD)
BREW_PREFIX := $(shell brew --prefix 2>/dev/null)

.PHONY: all
all: bootstrap dotfiles installers claude dnsmasq #! Full setup — everything.

.PHONY: help
help: #! Show this help message.
	@echo 'Usage: make [target] ...'
	@echo ''
	@echo 'Targets:'
	@fgrep -h "#!" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e "s/:.*#!/:/" | column -t -s":"

.PHONY: bootstrap
bootstrap: #! Install Homebrew, Oh My Zsh, Rosetta 2, iTerm2.
	@echo 'Setting up foundation dependencies...'
	@/usr/bin/env bash bootstrap/install.sh

	@# Make sure brew-managed zsh is registered as a valid shell.
	@if [ -n "$(BREW_PREFIX)" ] && ! fgrep -q "$(BREW_PREFIX)/bin/zsh" /etc/shells; then \
		echo "$(BREW_PREFIX)/bin/zsh" | sudo tee -a /etc/shells; \
		chsh -s "$(BREW_PREFIX)/bin/zsh"; \
	fi

	@echo ''
	@echo 'Tip: open iTerm and run this to install the Solarized Dark theme:'
	@echo '  open "$(CURDIR)/utils/Solarized Dark.itermcolors"'

.PHONY: clean
clean: #! Remove all symlinks created by this repo from $HOME.
	@find $(HOME)/ -maxdepth 1 -lname '$(CURDIR)/*' -delete
	@find $(HOME)/.claude -maxdepth 1 -lname '$(CURDIR)/*' -delete 2>/dev/null || true
	@echo 'Dotfiles symlinks removed. Restart your terminal.'

.PHONY: dotfiles
dotfiles: #! Symlink all *.symlink files into $HOME.
	@echo 'Creating symlinks to dotfiles.'
	@for src in $(shell find -H $(CURDIR) -name "*.symlink" -not -path '*/.git/*'); do \
		dest=$(HOME)/$$(basename $$src .symlink); \
		ln -sfn $$src $$dest; \
	done

	@# oh-my-zsh custom plugins (copied, since oh-my-zsh manages this directory)
	@cp -R $(CURDIR)/zsh/.oh-my-zsh/ $(HOME)/.oh-my-zsh/
	@echo 'Dotfiles installed. Restart your shell.'

.PHONY: installers
installers: #! Run Homebrew Brewfile (utils/install.sh).
	@/usr/bin/env bash utils/install.sh

.PHONY: claude
claude: #! Symlink Claude Code config into ~/.claude/.
	@/usr/bin/env bash claude/install.sh

.PHONY: dnsmasq
dnsmasq: #! Configure dnsmasq for routing to .docker hosts.
	brew install dnsmasq
	$(RM) $(BREW_PREFIX)/etc/dnsmasq.conf
	mkdir -p $(BREW_PREFIX)/etc/dnsmasq.d
	ln -sfn $(CURDIR)/dnsmasq/dnsmasq.conf $(BREW_PREFIX)/etc/dnsmasq.conf
	ln -sfn $(CURDIR)/dnsmasq/dnsmasq.d/docker.conf $(BREW_PREFIX)/etc/dnsmasq.d/docker.conf
	sudo mkdir -p /etc/resolver
	sudo ln -sfn $(CURDIR)/dnsmasq/resolver/docker /etc/resolver/docker
	sudo brew services restart dnsmasq
	sudo killall -HUP mDNSResponder
	sudo dscacheutil -flushcache
