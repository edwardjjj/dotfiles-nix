# Setup fzf
# ---------
if [[ ! "$PATH" == */home/edward/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/edward/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/edward/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/edward/.fzf/shell/key-bindings.zsh"
