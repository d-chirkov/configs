setopt PROMPT_SUBST
PROMPT='%F{cyan}[SERVICE] %1~%f%F{red}:%f '

PATH="$HOME/.local/bin:$HOME/bin:$PATH"

# run tmux on startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux a -t default || exec tmux new -s default && exit;
fi
