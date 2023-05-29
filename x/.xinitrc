[ -f ~/.xprofile ] && ~/.xprofile
[ -f ~/.Xresources ] && xrdb -merge -I$HOME ~/.Xresources
[ -f ~/.background ] && feh --bg-scale --no-xinerama ~/.background &
xbindkeys &
setxkbmap -option ctrl:nocaps &
xset r rate 200 30 &
exec dwm
