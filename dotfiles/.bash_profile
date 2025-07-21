# ~/.bash_profile

# Load .bashrc if it exists
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# Custom environment variables
export EDITOR=nvim
export GPG_TTY=$(tty)

# Launch key agents (optional)
if [ -z "$SSH_AUTH_SOCK" ]; then
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa 2>/dev/null
    ssh-add ~/.ssh/github_priv 2>/dev/null
fi
