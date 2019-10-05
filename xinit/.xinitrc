# Set Polish keyboard layout
setxkbmap pl

# Run compositor
compton &

# Statusbar loop
while true; do
    xsetroot -name "$( date +'%a %d %b, %R' )"
    sleep 1s # Update every second
done &

exec dwm

