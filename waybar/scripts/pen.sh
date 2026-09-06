#!/bin/bash
PERCENT=$(upower -i /org/freedesktop/UPower/devices/battery_wacom_battery_0 | grep "percentage:" | awk '{print $2}' | tr -d '%')

if [ -z "$PERCENT" ]; then
    exit 0
fi

if [ "$PERCENT" -le 10 ]; then
    CLASS="critical"
    ICON="󰁺"
elif [ "$PERCENT" -le 20 ]; then
    CLASS="critical"
    ICON="󰁻"
elif [ "$PERCENT" -le 30 ]; then
    CLASS="critical"
    ICON="󰁼"
elif [ "$PERCENT" -le 40 ]; then
    CLASS="warning"
    ICON="󰁽"
elif [ "$PERCENT" -le 50 ]; then
    CLASS="warning"
    ICON="󰁾"
elif [ "$PERCENT" -le 60 ]; then
    CLASS="warning"
    ICON="󰁿"
elif [ "$PERCENT" -le 70 ]; then
    CLASS="warning"
    ICON="󰂀"
elif [ "$PERCENT" -le 80 ]; then
    CLASS="normal"
    ICON="󰂁"
elif [ "$PERCENT" -le 90 ]; then
    CLASS="normal"
    ICON="󰂂"
elif [ "$PERCENT" -le 100 ]; then
    CLASS="normal"
    ICON="󰁹"
else
    CLASS="normal"
    ICON="󰷤"
fi

echo "{\"text\": \"$ICON $PERCENT%\", \"tooltip\": \"charge: $PERCENT%\", \"class\": \"$CLASS\"}"
