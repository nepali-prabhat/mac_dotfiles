#!/bin/bash

INTERACTIONS_DIR=~/Documents/code/kalysys/clevero-interactions/
IMPLEMENTATIONS_DIR=~/Documents/code/kalysys/kalysys-customers-implementations/

tmux new-session -Asexternals -ninteractions -c $INTERACTIONS_DIR \; attach-session -c ~/ \; new-window -nimplementations -c $IMPLEMENTATIONS_DIR \; new-window -nconsole -c $INTERACTIONS_DIR \; split-window -h -c $IMPLEMENTATIONS_DIR \; select-pane -l \; new-window -nscratch \; select-window -t 1 \;
