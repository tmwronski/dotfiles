#!/bin/sh

# Set Polish keyboard layout
setxkbmap pl

# Run compositor
command -v compton >/dev/null 2>&1 && { compton & }

# Statusbar loop
command -v xsetroot >/dev/null 2>&1 && {

    while true; do
        xsetroot -name "$( date +'%a %d %b, %R' )"
        sleep 1s # Update every second
    done &

}

# Set up monitors
command -v xrandr >/dev/null 2>&1 && {

    MONITORS_CNT=$(xrandr -d :0 -q | grep -c ' connected')
 
    if [ "$MONITORS_CNT" = 2 ]; then
        xrandr --output HDMI-1 --primary && xrandr --output eDP-1 --off
    fi
}

exec dwm

