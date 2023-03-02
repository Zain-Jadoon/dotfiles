from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
import subprocess
import os
from libqtile import hook


terminal = "st"
colors = {
  "blue": "#0F2028",
  "pink": "#9E3208",
  "yellow":"#BA7222",
  #"green": "#56949f", #9ccfd8
  "green": "#0B6E4F",
  "lavender": "#BC9B76",
  "white": "#FFFFFF",
  "light_grey": "#e0def4",
  "dark_grey": "#6e6a86",
}

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])

mod = "mod1"
keys = [
    Key([mod], "u", lazy.spawn("~/.config/qtile/lock.sh")),
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),
    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"), Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"), Key(
        [mod, "shift"],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload the config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "d", lazy.spawncmd(), desc="Spawn a command using a prompt widget"),
    Key([mod], "f", lazy.window.toggle_floating(), desc='Toggle floating'), 

    Key([mod], "m", lazy.layout.grow()),
    Key([mod], "i", lazy.layout.shrink()),
]

groups = [Group(i) for i in ["1", "2", "3", "4", "5", "6", "7", "8","9"]]
group_hotkeys = "123456789"

for g, k in zip(groups, group_hotkeys):
    keys.extend(
        [
            Key(
                [mod],
                k,
                lazy.group[g.name].toscreen(),
                desc=f"Switch to group {g.name}",
            ),
            # mod1 + shift + letter of group = switch to & move focused window to group
            Key(
                [mod, "shift"],
                k,
                lazy.window.togroup(g.name, switch_group=False),
                desc=f"Switch to & move focused window to group {g.name}",
            ),
        ]
    )


layouts = [

    layout.MonadTall(margin = 8,
            border_focus = colors["blue"],
            border_width = 3,

        ),
    layout.Max(
            margin = 8,
            border_focus = colors["blue"],
            border_width = 3,
        ),
    # layout.Matrix(),
    # layout.MonadWide(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
]
widget_defaults = dict(
    font="JetBrainsMono",
    fontsize=14,
    padding=3,
)
def get_widgets():
    widget_list = [
    widget.CurrentLayout(
        background = colors["blue"]
        ),
    widget.TextBox(
        text="",
        foreground = colors["blue"],
        background = colors["blue"],
        padding=0,
        fontsize=19,
    ),
    widget.GroupBox(
        fontsize=18,
        highlight_method='line',
        highlight_color = [colors["blue"],colors["blue"]],
        background = colors["blue"],
        foreground = colors["white"],
        inactive = colors["white"],
        this_screen_border= colors["light_grey"],
        this_current_screen_border = colors["light_grey"],

        ),
    widget.TextBox(
        text="",
        foreground = colors["blue"],
        background = "#0E1018",
        padding=0,
        fontsize=19,
    ),
    widget.Spacer(length=10, background="#0E1018"), 
    widget.Prompt(),
    widget.WindowName(),
    widget.Chord(
        chords_colors={
            "launch": ("#ff0000", "#ffffff"),
   
        },
        name_transform=lambda name: name.upper(),
    ),

    widget.TextBox(
        text="",
        padding=0,
        fontsize=30,
        foreground = colors["yellow"],
        background = "#0E1018",
    ),

    widget.CPU(
        format="CPU: {load_percent:04}%",
        mouse_callbacks={"Button1": lazy.spawn("alacritty -e htop")},
        background=colors["yellow"],

    ),
    widget.TextBox(
        text="",
        padding=0,
        fontsize=30,
        foreground=colors["blue"],
        background=colors["yellow"],
    ),
    widget.CapsNumLockIndicator(fmt="⌨ {}", background=colors["blue"]),
    
    widget.TextBox(
        text="",
        foreground = colors["lavender"],
        background = colors["blue"],
        padding=0,
        fontsize=18,
    ),

    widget.Clock(format="🕐 %a %d %b %Y, %I:%M %p", background=colors["lavender"]),
    widget.TextBox(
        text="",
        foreground = colors["blue"],
        background = colors["lavender"],
        padding=0,
        fontsize=18,
    ),
     widget.Battery(
        format="{char} {percent:2.0%}",
        charge_char="bat:",
        discharge_char="bat:",
        full_char="bat:",
        unknown_char="bat:",
        empty_char="bat:",
        show_short_text=False,
        background=colors["blue"],
        ),

    widget.TextBox(
        text="",
        foreground = colors["yellow"],
        background = colors["blue"],
        padding=0,
        fontsize=18,
    ),
    
    widget.TextBox(
        text = "⏻",
        fontsize = "22",
        background = colors["yellow"],
        mouse_callbacks={
            "Button1": lazy.spawn("pkill xinit"),
        }
    ),
    ]
    return widget_list


extension_defaults = widget_defaults.copy()
screens = [
    Screen(
        top=bar.Bar(
            get_widgets(),
            24,
            background="#0E1018", opacity=1

            # border_width=[2, 0, 2, 0],  # Draw top and bottom borders
            # border_color=["ff00ff", "000000", "ff00ff", "000000"]  # Borders are magenta
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ]
)
# random bullshit
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wmname = "LG3D"
