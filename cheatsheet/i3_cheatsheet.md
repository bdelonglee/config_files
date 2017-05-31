My I3 Cheatsheet
================

as configured in my .config/i3/config (https://github.com/bdelonglee/config_files/blob/master/i3/config)

## Bindings

    $mod  =             Windows key
    mod1  =             Alt
    $term =             konsole --hide-menubar

## Windows Management

    $mod+Shift+q        Kill focused window
    $mod+Return         exec $term; focus
    $mod+Shift+Return   exec $term -e tmux -2
    $mod+Shift+space    floating toggle
    $mod+space          focus mode_toggle
    $mod+r              Mode Resize
                        h/Left, j/Down, k/Up, l/Right, Return/Escape

    $mod+h/j/k/l        Change focus
    $mod+Left/Down...

    $mod+Shift+h/j...   Switch panes or Move in floating mode
    $mod+Shift+Left...

    $mod+p              next windows will be on the right
    $mod+o              next windows will be under the current (stack)
    $mod+i              toggl split direction

    $mod+f              fullscreen
    F11

    $mod+s              Stack mode
    $mod+t              Tab mode
    $mod+e              Tile mode

    $mod+q              Focus parent container

    Mod1+Tab            workspace next
    Mod1+Shift+Tab      workspace prev
    $mod+Tab            workspace back_and_forth

    $mod+b              Status bar visibility toggle
    $mod+shift+b        Border toggle

## System Utilities

    $mod+d              dmenu       Software Launcher
    $mod+Shift+d        j-4 dmenu   Software Launcher

    $mod+Shift+c        Reload I3 config
    $mod+Shift+r        Restart I3

    $mod+Shift+g        Mode Gaps (Inner/Outer)
    $mod+Ctrl+r         Reset Gaps

    Print               Fast print
    Control+Print       Interactive gnome-screenshot

## Variety

    mod1+t              Trash Wallpaper
    mod1+n              Next Wallpaper
    mod1+p              Previous Wallpaper
    mod1+f              Favorite Wallpaper

## Tricks

#### QWERTY US International Keyboard
    exec setxkbmap -layout us -variant altgr-intl -option nodeadkeys

#### Get the mouse out of the way with unclutter
    exec unclutter 

#### Dual Screen
use xrandr to know the names of your monitors
use this line to tell which monitor is on the right

    xrandr --output DVI-I-2 --right-of DVI-I-1 --auto

ex:

    set $firstMonitor  DVI-I-1
    set $secondMonitor DVI-I-2

Workspace assigned to monitor

    workspace $ws1 output $firstMonitor
