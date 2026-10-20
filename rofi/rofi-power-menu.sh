#!/usr/bin/env bash

set -euo pipefail

ROFI_THEME="${ROFI_THEME:-${XDG_CONFIG_HOME:-$HOME/.config}/rofi/powermenu.rasi}"
SESSION_ID="${XDG_SESSION_ID:-$(loginctl | awk '/tty|pts/ {print $1; exit}') }"

LOCK='  Lock'
LOGOUT='  Logout'
SUSPEND='  Suspend'
REBOOT='  Reboot'
SHUTDOWN='  Shutdown'

run_lock() {
    if command -v betterlockscreen >/dev/null 2>&1; then
        betterlockscreen -l
    elif command -v i3lock >/dev/null 2>&1; then
        i3lock
    elif command -v loginctl >/dev/null 2>&1; then
        loginctl lock-session "$SESSION_ID"
    fi
}

choice=$(printf '%s\n' "$LOCK" "$LOGOUT" "$SUSPEND" "$REBOOT" "$SHUTDOWN" |
    rofi -dmenu -i -no-custom -p "" -theme "$ROFI_THEME")

case "$choice" in
"$LOCK")
    run_lock
    ;;
"$LOGOUT")
    loginctl terminate-user $USER
    ;;
"$SUSPEND")
    systemctl suspend
    ;;
"$REBOOT")
    systemctl reboot
    ;;
"$SHUTDOWN")
    systemctl poweroff
    ;;
esac
