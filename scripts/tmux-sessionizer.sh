search_dirs=~/Code

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find $search_dirs -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -n $TMUX ]] && tmux has-session -t=$selected_name 2>/dev/null; then
  tmux switch-client -t $selected_name
  exit 0
fi

if [[ -n $TMUX ]]; then
  tmux new-session -s $selected_name -c $selected -d
  tmux switch-client -t $selected_name
  exit 0
fi

if ! tmux has-session -t=$selected_name 2>/dev/null; then
  tmux new-session -s $selected_name -c $selected -d
  tmux attach-session -t $selected_name
  exit 0
fi

tmux attach-session -t $selected_name
exit 0
