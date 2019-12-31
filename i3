# i3 config file (v4)
#
# Please see https://i3wm.org/docs/userguide.html for a complete reference!
#
# This config file uses keycodes (bindsym) and was written for the QWERTY
# layout.
#
# To get a config file with the same key positions, but for your current
# layout, use the i3-config-wizard
#

# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:monospace 11

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
#font pango:DejaVu Sans Mono 8

# Before i3 v4.8, we used to recommend this one as the default:
# font -misc-fixed-medium-r-normal--13-120-75-75-C-70-iso10646-1
# The font above is very space-efficient, that is, it looks good, sharp and
# clear in small sizes. However, its unicode glyph coverage is limited, the old
# X core fonts rendering does not support right-to-left and this being a bitmap
# font, it doesn't scale on retina/hidpi displays.

# use these keys for focus, movement, and resize directions when reaching for
# the arrows is not convenient
set $up l
set $down k
set $left j
set $right semicolon

# use Mouse+Mod4 to drag floating windows to their wanted position
floating_modifier Mod4

# start a terminal
bindsym Mod4+Return exec i3-sensible-terminal

# kill focused window
bindsym Mod4+Shift+q kill

# start dmenu (a program launcher)
bindsym Mod4+d exec dmenu_run
bindsym Mod4+Shift+d exec dmenu_run
# There also is the (new) i3-dmenu-desktop which only displays applications
# shipping a .desktop file. It is a wrapper around dmenu, so you need that
# installed.
# bindsym Mod4+d exec --no-startup-id i3-dmenu-desktop

# change focus
bindsym Mod4+$left focus left
bindsym Mod4+$down focus down
bindsym Mod4+$up focus up
bindsym Mod4+$right focus right
bindsym Mod4+Mod1+$left focus left
bindsym Mod4+Mod1+$down focus down
bindsym Mod4+Mod1+$up focus up
bindsym Mod4+Mod1+$right focus right

# alternatively, you can use the cursor keys:
bindsym Mod4+Left focus left
bindsym Mod4+Down focus down
bindsym Mod4+Up focus up
bindsym Mod4+Right focus right

# move focused window
bindsym Mod4+Shift+$left move left
bindsym Mod4+Shift+$down move down
bindsym Mod4+Shift+$up move up
bindsym Mod4+Shift+$right move right

# alternatively, you can use the cursor keys:
bindsym Mod4+Shift+Left move left
bindsym Mod4+Shift+Down move down
bindsym Mod4+Shift+Up move up
bindsym Mod4+Shift+Right move right

# split in horizontal orientation
bindsym Mod4+h split h

# split in vertical orientation
bindsym Mod4+v split v

# enter fullscreen mode for the focused container
bindsym Mod4+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym Mod4+s layout stacking
bindsym Mod4+w layout tabbed
bindsym Mod4+e layout toggle split
bindsym Mod4+a focus parent
bindsym Mod4+x focus child

# toggle tiling / floating
bindsym Mod4+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym Mod4+space focus mode_toggle

# focus the parent container
#bindsym Mod4+a focus parent

# focus the child container
#bindsym Mod4+d focus child

# move the currently focused window to the scratchpad
bindsym Mod4+Shift+minus move scratchpad

# Show the next scratchpad window or hide the focused scratchpad window.
# If there are multiple scratchpad windows, this command cycles through them.
bindsym Mod4+minus scratchpad show

# switch to workspace
bindsym Mod4+1 workspace number 1
bindsym Mod4+2 workspace number 2
bindsym Mod4+3 workspace number 3
bindsym Mod4+4 workspace number 4
bindsym Mod4+5 workspace number 5
bindsym Mod4+6 workspace number 6
bindsym Mod4+7 workspace number 7
bindsym Mod4+8 workspace number 8
bindsym Mod4+9 workspace number 9
bindsym Mod4+0 workspace number 10

# move focused container to workspace
bindsym Mod4+Shift+1 move container to workspace number 1
bindsym Mod4+Shift+2 move container to workspace number 2
bindsym Mod4+Shift+3 move container to workspace number 3
bindsym Mod4+Shift+4 move container to workspace number 4
bindsym Mod4+Shift+5 move container to workspace number 5
bindsym Mod4+Shift+6 move container to workspace number 6
bindsym Mod4+Shift+7 move container to workspace number 7
bindsym Mod4+Shift+8 move container to workspace number 8
bindsym Mod4+Shift+9 move container to workspace number 9
bindsym Mod4+Shift+0 move container to workspace number 10

# move focused container to workspace and switch to workspace
bindsym Mod4+Ctrl+1 move container to workspace number 1; workspace number 1
bindsym Mod4+Ctrl+2 move container to workspace number 2; workspace number 2
bindsym Mod4+Ctrl+3 move container to workspace number 3; workspace number 3
bindsym Mod4+Ctrl+4 move container to workspace number 4; workspace number 4
bindsym Mod4+Ctrl+5 move container to workspace number 5; workspace number 5
bindsym Mod4+Ctrl+6 move container to workspace number 6; workspace number 6
bindsym Mod4+Ctrl+7 move container to workspace number 7; workspace number 7
bindsym Mod4+Ctrl+8 move container to workspace number 8; workspace number 8
bindsym Mod4+Ctrl+9 move container to workspace number 9; workspace number 9
bindsym Mod4+Ctrl+0 move container to workspace number 10; workspace number 10

# reload the configuration file
bindsym Mod4+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym Mod4+Shift+r restart
# exit i3 (logs you out of your X session)
bindsym Mod4+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut. Do you really want to exit i3? This will end your X session.' -B 'Yes, exit i3' 'i3-msg exit'"

# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym $left       resize shrink width 10 px or 10 ppt
        bindsym $down       resize grow height 10 px or 10 ppt
        bindsym $up         resize shrink height 10 px or 10 ppt
        bindsym $right      resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left        resize shrink width 10 px or 10 ppt
        bindsym Down        resize grow height 10 px or 10 ppt
        bindsym Up          resize shrink height 10 px or 10 ppt
        bindsym Right       resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or Mod4+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym Mod4+r mode "default"
}

bindsym Mod4+r mode "resize"

# Start i3bar to display a workspace bar (plus the system information i3status
# finds out, if available)
bar {
        status_command i3status
        separator_symbol "|"
}

#######################################################################

# style
default_border pixel 1
hide_edge_borders smart

# autostart
exec --no-startup-id nm-applet
exec --no-startup-id volumeicon
exec --no-startup-id xss-lock -- xsecurelock

# select output display
## HDMI
bindsym Mod4+F1 exec --no-startup-id xrandr --output HDMI2 --off --output eDP1 --auto
bindsym Mod4+F2 exec --no-startup-id xrandr --output HDMI2 --auto --output eDP1 --off
bindsym Mod4+F3 exec --no-startup-id xrandr --output eDP1 --auto --output HDMI2 --auto --right-of eDP1
bindsym Mod4+F4 exec --no-startup-id xrandr --output HDMI2 --auto --output eDP1 --auto --right-of HDMI2
## USB-C
bindsym Mod4+Shift+F1 exec --no-startup-id xrandr --output DP1 --off --output eDP1 --auto
bindsym Mod4+Shift+F2 exec --no-startup-id xrandr --output DP1 --auto --output eDP1 --off
bindsym Mod4+Shift+F3 exec --no-startup-id xrandr --output eDP1 --auto --output DP1 --auto --right-of eDP1
bindsym Mod4+Shift+F4 exec --no-startup-id xrandr --output DP1 --auto --output eDP1 --auto --right-of DP1

# rotate display
#bindsym Mod4+Ctrl+Left exec --no-startup-id xrandr -o right
#bindsym Mod4+Ctrl+Down exec --no-startup-id xrandr -o normal
#bindsym Mod4+Ctrl+Right exec --no-startup-id xrandr -o left

# screen brightness
bindsym XF86MonBrightnessUp exec xbacklight -inc 10 # increase screen brightness
bindsym XF86MonBrightnessDown exec xbacklight -dec 10 # decrease screen brightness
bindsym Shift+XF86MonBrightnessUp exec xbacklight -inc 1 # increase screen brightness
bindsym Shift+XF86MonBrightnessDown exec xbacklight -dec 1 # decrease screen brightness

# screen color
bindsym Mod4+z exec --no-startup-id xcalib -a -i
bindsym Mod4+F5 exec --no-startup-id xcalib -blue 1 0 70 -green 1 0 80 -a
bindsym Mod4+F6 exec --no-startup-id xcalib -c -a

# launch apps
bindsym Mod4+b fullscreen disable; exec --no-startup-id browser
bindsym Mod4+Shift+b fullscreen disable; exec --no-startup-id chromium
bindsym Mod4+t fullscreen disable; exec --no-startup-id alacritty
bindsym Shift+Ctrl+4 exec flameshot gui
bindsym Mod4+n exec nm-popup

# lock screen
bindsym Mod4+Ctrl+L exec --no-startup-id xsecurelock

# keyboard layout
exec --no-startup-id setxkbmap 'us(altgr-intl)'

# background picture
exec --no-startup-id feh --bg-center /home/daniel/bgs/gondola002.jpg

# set repeat rate
exec --no-startup-id xset r rate 400 60

# misc
#bindsym Mod4+G workspace "google"
#exec --no-startup-id i3-msg 'workspace google; exec /usr/bin/term -e googler'
#exec --no-startup-id i3-msg 'workspace 1'
