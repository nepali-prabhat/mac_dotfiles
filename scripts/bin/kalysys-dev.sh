#!/bin/bash

CLIENT_DIR=~/Documents/code/kalysys/kalysys-client/
SERVER_DIR=~/Documents/code/kalysys/kalysys-server/

tmux new-session -Askalysys -nclient -c $CLIENT_DIR \; attach-session -c ~/ \; new-window -nserver -c $SERVER_DIR \; new-window -nconsole -c $CLIENT_DIR \; split-window -h -c $SERVER_DIR \; select-pane -l \; new-window -nscratch \; select-window -t 3 \;
