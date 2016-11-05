# === Basics
setopt no_beep # Don't beep on error
setopt interactive_comments # Allow comment in interactive shells


setopt auto_cd # If you type foo, and it isn't a command, and it is a directory in your cdpath, go there


# Allow for functions in the prompt.
setopt PROMPT_SUBST

# Autocompletion of command line for aliases
setopt completealiases


# ===== Correction
setopt correct # spelling correction for commands
setopt correctall # spelling correction for arguments