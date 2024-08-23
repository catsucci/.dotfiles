#!/usr/bin/env bash

# Create a new window in the existing tmux session and run the command
tmux new-window "bash -c '~/bin/.local/scripts/cht.sh --shell; exec \$SHELL'"

