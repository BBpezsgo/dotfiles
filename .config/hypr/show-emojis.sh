#!/bin/sh

# Source: https://github.com/biox/shmoji

emoji=$(cat "$HOME/.config/hypr/emojis.txt" | tofi --config $HOME/.config/tofi/emojis | cut -d " " -f 1 | tr -d '\n')
[ "$emoji" ] && wl-copy $emoji
