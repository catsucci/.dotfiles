#!/bin/bash

# Get list of pane IDs with terminals
pane_list=$(tmux list-panes -F "#{pane_id} #{pane_current_command}" | grep -E "bash|zsh|fish" | cut -d ' ' -f 1)

# Loop through each pane and send the refresh command
for pane in $pane_list; do
    tmux send-keys -t "$pane" Enter
done

