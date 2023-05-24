setopt PROMPT_SUBST
PROMPT='%F{cyan}[SERVICE] %1~%f%F{red}:%f '

PATH="$HOME/.local/bin:$HOME/bin:$PATH"

SAVEHIST=10000
HISTFILE=~/.zsh_history

bindkey "\e[A" history-search-backward
bindkey "\e[B" history-search-forward
bindkey "\eOA" history-search-backward
bindkey "\eOB" history-search-forward

# run tmux on startup
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux a -t default || exec tmux new -s default && exit;
fi
