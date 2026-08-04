#!/bin/bash

# Get microphone mute status
mic_muted=$(pactl get-source-mute @DEFAULT_SOURCE@ | grep -o "yes\|no")

if [ "$mic_muted" = "yes" ]; then
    echo '{"text": "󰍭", "class": "muted"}'
else
    echo '{"text": "󰍬", "class": "unmuted"}'
fi
