#!/bin/bash

#PERCENT=$(upower -i /org/freedesktop/UPower/devices/battery_wacom_battery_0 | grep "percentage:" | awk '{print $2}' | tr -d '%')
#secound iteration, if this fails, revert to previous and manuallu update battery_wacom_battery_0 to match
for device in $(upower -e | grep "battery_wacom_battery_"); do
    VAL=$(upower -i "$device" | grep "percentage:" | awk '{print $2}' | tr -d '%')
    if [ -n "$VAL" ] && [ "$VAL" -gt 0 ]; then
        PERCENT=$VAL
        break
    fi
done

if [[ -n "$PERCENT" && "$PERCENT" -le 10 ]]; then
    CLASS="critical"
    ICON="󰁺"
elif [[ -n "$PERCENT" && "$PERCENT" -le 20 ]]; then
    CLASS="critical"
    ICON="󰁻"
elif [[ -n "$PERCENT" && "$PERCENT" -le 30 ]]; then
    CLASS="critical"
    ICON="󰁼"
elif [[ -n "$PERCENT" && "$PERCENT" -le 40 ]]; then
    CLASS="warning"
    ICON="󰁽"
elif [[ -n "$PERCENT" && "$PERCENT" -le 50 ]]; then
    CLASS="warning"
    ICON="󰁾"
elif [[ -n "$PERCENT" && "$PERCENT" -le 60 ]]; then
    CLASS="warning"
    ICON="󰁿"
elif [[ -n "$PERCENT" && "$PERCENT" -le 70 ]]; then
    CLASS="warning"
    ICON="󰂀"
elif [[ -n "$PERCENT" && "$PERCENT" -le 80 ]]; then
    CLASS="normal"
    ICON="󰂁"
elif [[ -n "$PERCENT" && "$PERCENT" -le 90 ]]; then
    CLASS="normal"
    ICON="󰂂"
elif [[ -n "$PERCENT" && "$PERCENT" -le 100 ]]; then
    CLASS="normal"
    ICON="󰁹"
else
    CLASS="warning"
    ICON="󰷤"
    SHOW_PERCENT="false"
fi

echo "{\"text\": \"$ICON $PERCENT%\", \"tooltip\": \"charge: $PERCENT%\", \"class\": \"$CLASS\"}"
