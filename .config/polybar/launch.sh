#! /bin/bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# NOTE(Jovan): Launch polybar for multiple monitors
if type "xrandr"; then
    for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
        MONITOR=$m polybar --reload mainbar &
    done
else
    polybar --reload mainbar &
fi

# NOTE(Jovan): Get i3 workspace names
#sh ~/.config/polybar/generate-ws-icon-list.sh
# Launch Polybar, using default config location ~/.config/polybar/config
# polybar mainbar -r &
# polybar mainbar &
