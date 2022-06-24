#!/usr/bin/env bash

# startup sound
mpv /usr/share/sounds/laugh.mp3 1>/dev/null 2>/dev/null &

# startup picom compositor
picom --experimental-backends --config ~/.config/picom/picom.conf 1>/dev/null 2>/dev/null &
