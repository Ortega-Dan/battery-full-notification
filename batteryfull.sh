#!/usr/bin/env bash
while true
do
    export DISPLAY=:0.0
    battery_percent=$(acpi -b | grep -P -o '[0-9]+(?=%)')
    if on_ac_power; then
        if [ "$battery_percent" -gt 95 ]; then
            notify-send -u critical "Battery fully charged"
            paplay /usr/share/sounds/gnome/default/alerts/glass.ogg
            paplay /usr/share/sounds/gnome/default/alerts/glass.ogg
        fi
    fi
    sleep 300 # (5 minutes)
done
