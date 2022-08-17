#!/bin/bash

CLIENT_DIR=~/Documents/code/kalysys/kalysys-client/
SERVER_DIR=~/Documents/code/kalysys/kalysys-server/
WORKFLOW_DIR=~/Documents/code/kalysys/clevero-workflow/
INTERACTIONS_DIR=~/Documents/code/kalysys/clevero-interactions/

tmux new-session -Askalysys -nclient -c $CLIENT_DIR \; attach-session -c ~/ \; new-window -nserver -c $SERVER_DIR \; new-window -nconsole -c $CLIENT_DIR \; split-window -h -c $SERVER_DIR \; split-window -v -c $WORKFLOW_DIR \; select-pane -l \; new-window -nworkflow -c $WORKFLOW_DIR\; new-window -ninteractions -c $INTERACTIONS_DIR \; select-window -t 3 \;
