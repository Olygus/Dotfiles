#!/bin/bash

# Check if the OpenVPN network interface (tun0) is active
if ip link show tun0 >/dev/null 2>&1; then
    # VPN is connected
    echo '{"text": "VPN ", "class": "connected", "tooltip": "ProtonVPN Connected"}'
else
    # VPN is disconnected
    echo '{"text": "VPN ", "class": "disconnected", "tooltip": "VPN Disconnected"}'
fi
