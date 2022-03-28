#! /bin/bash
# DISPLAY=:0.0
while true; do
    nvidiahighcpu=$(ps aux|grep nvidia-powerd|head -n 1|awk '{print ($3 > 6)}')
    echo $nvidiahighcpu
    # echo $battery_percent
    if [ "$nvidiahighcpu" == "1" ]; then
        notify-send -u critical "NVIDIA POWERD"
        paplay /usr/share/sounds/gnome/default/alerts/glass.ogg
        paplay /usr/share/sounds/gnome/default/alerts/glass.ogg
        paplay /usr/share/sounds/gnome/default/alerts/glass.ogg
    fi
    sleep 120 # (2 minutes)
done
