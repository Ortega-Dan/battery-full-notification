#! /bin/bash
# DISPLAY=:0.0
while true; do
    battery_info=$(acpi -b)
    charging_status=$(echo $battery_info | grep -P -o "\S+harging")
    battery_percent=$(echo $battery_info | grep -P -o "[0-9]+(?=%)")
    if [ "$charging_status" = "Charging" ]; then
        if [ "$battery_percent" -gt 95 ]; then
            notify-send -u critical "Battery fully charged"
            paplay /usr/share/sounds/gnome/default/alerts/glass.ogg
            paplay /usr/share/sounds/gnome/default/alerts/glass.ogg
        fi
    fi
    sleep 180 # (3 minutes)
done
