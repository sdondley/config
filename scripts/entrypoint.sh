#!/bin/ash
set -eu
export LC_CTYPE="C.UTF-8"
export LANG="C.UTF-8"
nvim --headless "+Lazy! sync" +qa   
nvim --headless "+Lazy! update" +qa      
nvim --headless "+Lazy! install" +qa
tmux new -s main -d && tmux split-window -h -d
tmux attach -t main

exec "$@"
