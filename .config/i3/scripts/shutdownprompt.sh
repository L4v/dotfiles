#! /bin/bash

# NOTE(Jovan): Usage
# ./shutdownprompt "Do you want to shutdown?" "poweroff"

[ $(echo -e "No\nYes" | dmenu -fn "-*-consolas-*-r-*-*-*-*-*-*-*-*-*-uni" -nb '#222222' -sf '#eeeeee' -sb '#c73000' -nf '#bbbbbb' -i -p "$1") \
== "Yes" ] && $2