[ -f ~/.xprofile ] && ~/.xprofile
[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources
[ -f ~/.background ] && feh --bg-scale --no-xinerama ~/.background &
xbindkeys &
setxkbmap -option ctrl:nocaps &
xset r rate 200 30 &
xset s noblank
xset s off
command -v status &> /dev/null && status &
exec dwm
