# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

# FS operations
alias ll='ls -alGh'
alias ls='ls -Gh'

# Generic utils
alias c="clear"

# Mimic vim functions
alias :q='exit'

# Easier navigation
alias ..="cd .."
alias ...="cd ..."
alias ~="cd ~"

# PS
alias psa="ps aux"
alias psg="ps aux | grep "

# Pipe public key to clipboard (private key alias removed for security)
alias pubkey="more ~/.ssh/id_ed25519.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
