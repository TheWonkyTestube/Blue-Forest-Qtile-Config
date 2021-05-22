"""Qtile Config."""

# All imports are from the base for Qtile. A super duper simple build!!
from typing import List

import os
import subprocess
from libqtile import bar, layout, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy


mod = "mod4"
terminal = "termite"


def hide_show_bar(qtile):
    """Toggle the eww bar."""
    script = os.path.expanduser('~/.config/qtile/scripts/toggleBar.sh')
    subprocess.call([script])
    gap = qtile.screens[0].top
    if gap.size == 0:
        gap.size = 48
    else:
        gap.size = 0


# The keys list defines the key-bindings that qtile uses.You define key-bindings using a Key object,
# which takes arguments for the keys in the binding, usually the mod key and a letter, then a lazy
# function. When those keys are pressed, the lazy function is activated.

keys = [
    # Switch focus between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to the next window"),

    # Return  window in focus to floating
    Key([mod], "t", lazy.window),

    # Move window in focus left/right or move up/down
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Change window sizes when in tiling mode
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Makes window in focus take up the entire stack/return to its normal state
    # In column mode for example, the window will take up the whole side of the
    # screen that its on
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle between split and unsplit sides of stack"),

    # Launch a terinal
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),

    # Close Window in Focus
    Key([mod], "w", lazy.window.kill(), desc="Kill focused window"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Kill focused window"),

    # Restart/Quit Qtile
    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Run apps. Very variable success rate, another app launcher like rofi is reccomended
    Key([mod], "r", lazy.spawncmd(),desc="Spawn a command using a prompt widget"),

    # Spawn apps
    Key([mod, "shift"], "b", lazy.spawn("vivaldi-stable file:///home/will/Coding/internet%20Coding/homepage/Homepage.html"), desc="Launch brave"),
    Key([mod, "shift"], "a", lazy.spawn("atom"), desc="Launch atom"),
    Key([mod, "shift"], "o", lazy.spawn("libreoffice"), desc="Launch libreoffice"),
    Key([mod, "shift"], "p", lazy.spawn("thunar"), desc="Launch thunar"),
    Key([mod], "p", lazy.spawn("rofi -show drun"), desc="Launch rofi"),

    # Adjust Volume levels
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -q set Master 2.5%- unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -q set Master 2.5%+ unmute")),

    # openBar
    Key([mod], "b", lazy.function(hide_show_bar)),

]







# The groups list governs the workspaces that windows can exist in. Each group is defined by a name, which
# is used by qtile as a reference for moving between groups. Each group also has a label, which in this case
# is a font awesome icon, like this: . Some groups spawn programs on startup, using the spawn argument. Other
# groups steal specific apps from other places, using the matches parameter. For example, everytime the browser
# is opened, group 4 steals it, and runs it there
# The for loop at the bottom just adds key-bindings to the keys list that allow for navigation between groups.
# By pressing the mod key and the number of the group, qtile displays the windows in the group. Pressing
# this combination, and the shift button moves the window in focus to that group, then displays that group
groups = [
                Group("0",
                      label="  "),

                Group("1",
                      label="  "),

                Group("2",
                      label="  "),

                Group("3",
                      spawn="joplin-desktop",
                      label="  "),
                Group("4",
                      spawn="min",
                      label=" 爵 "),
                Group("5",
                      spawn="atom",
                      label="  "),
                Group("6",
                      label="  "),
                Group("7",
                      label="  "),
                Group("8",
                      label="  "),

]
for i in range(len(groups)):
    keys.append(Key([mod], str((i+1)), lazy.group[str(i)].toscreen()))
    keys.append(Key([mod, "shift"], str((i+1)), lazy.window.togroup(str(i), switch_group=True)))












# The layouts list just governs the possible layouts that qtile can display windows in. Again, only built-in layouts
# have been used in this build.
layouts = [
    layout.Columns(border_focus_stack='#ffffff', margin=8),
    layout.Max(margin=8),
    layout.Bsp(margin=8),
    layout.Matrix(border_focus_stack='#ffffff', margin=8),
    layout.MonadWide(border_focus_stack='#ffffff', margin=8),
]










# This Section activates a screen for apps and such to be drawn to, then leaves a space for the bar that is coded in eww. The
# gap starts at zero, but is expanded when the eww bar is opened.
screens = [Screen(top=bar.Gap(0),),]




















# This bit tells qtile what to do with mouse input. As is usual for window managers, by clicking and dragging a window
#while also pressing the mod button, the window becomes floating, and moves with the mouse. You can resize floating
#windows using the right click, and bring windows to front with the wheel
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
    Click(["shift"], "Button3", lazy.spawn("rofi -show drun"), desc="Launch rofi"),
]
























#The first bit tells Qtile to run the autostart file when it is started. The autostart file does the wallpaper, activates the compositor,
#and sets the keymap on my build the rest is the final options for qtile. Most of this stuff is pretty obvious, and doesn't really need to be
#messed with. The floating layout section is a list of window types that should automatically spawn as floating. If an app you're trying to
#glitches when spawned normally, try adding it to the list below, using the same match syntax  as with the group section. Finally at the bottom,
#the clever people who coded Qtile lie to the computer and say that Qtile is a Java window manager so it'll work correctly.
@hook.subscribe.startup
def autostart():
    home=os.path.expanduser('~/.config/qtile/scripts/autostart.sh')
    subprocess.call([home])



dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='Termite'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),
    Match(title="Spell and Grammar Check Dialog"),  # gitk
    Match(title='Krita - Edit Text'),
    Match(title='ksnip'),  # Krita Text Editor
])
auto_fullscreen = True
focus_on_window_activation = "smart"
wmname = "LG3D"
