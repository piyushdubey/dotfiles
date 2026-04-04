# Lazy-load NVM to avoid ~300ms shell startup penalty.
# NVM is only loaded when you first call nvm, node, or npm.
lazynvm() {
  unset -f nvm node npm npx
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
}

nvm() { lazynvm; nvm "$@"; }
node() { lazynvm; node "$@"; }
npm() { lazynvm; npm "$@"; }
npx() { lazynvm; npx "$@"; }
