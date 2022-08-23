eval "$(/opt/homebrew/bin/brew shellenv)"

# Development Environment
source ~/.zsh_partials/homebrew.sh

# Language Environments
export PYENV_ROOT="$HOME/.pyenv"
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi
if which nodenv > /dev/null; then eval "$(nodenv init -)"; fi
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
if which exenv > /dev/null; then eval "$(exenv init -)"; fi

# App Environment
source ~/.zsh_partials/go.sh

# Servers & Infrastructures
source ~/.zsh_partials/docker.sh

# MIDIBox
source ~/.zsh_partials/midibox.sh
