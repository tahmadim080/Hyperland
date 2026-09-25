
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- TahmAdim .--
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "1920x1080@60hz",
    position = "auto",
    scale    = "1.2",
})

---------------------
---- MY PROGRAMS ----
---------------------

local terminal    = "kitty"
local fileManager = "thunar"
local menu        = "rofi -show drun"


-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE")
  hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP HYPRLAND_INSTANCE_SIGNATURE")
  hl.exec_cmd("gsettings set org.gnome.desktop.interface font-name 'JetBrains Mono 14'")
  hl.exec_cmd("killall -9 xdg-desktop-portal-hyprland xdg-desktop-portal-gnome xdg-desktop-portal-wlr xdg-desktop-portal")
  hl.exec_cmd("/usr/libexec/xdg-desktop-portal-hyprland &")
  hl.exec_cmd("sleep 2 && /usr/libexec/xdg-desktop-portal &")
  hl.exec_cmd("waybar")
  hl.exec_cmd("gammastep -O 5200 &")
  hl.exec_cmd("swaybg -i /home/tahmadim/Pictures/Wally/wallhaven-pomo69.jpg")
end)

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")

-----------------------
---- LOOK AND FEEL ----
-----------------------

hl.config({

    general = {
        gaps_in  = 7,
        gaps_out = 12,

        border_size = 0,

        col = {
            active_border   = { colors = {"#232634", "#232634"}, angle = 45 },
            inactive_border = "#232634",
        },

        resize_on_border = false,

        allow_tearing = false,

        layout = "dwindle",
    },

    decoration = {
        rounding       = 9,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = true,
            range        = 12,
            render_power = 10,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled = true,
            size = 8,
            passes = 3,
            new_optimizations = true,
            ignore_opacity = true,
            xray = false,
        },
    },

    animations = {
        enabled = true,
    },
})

  hl.curve("smooth", { type = "bezier", points = { { 0.22, 1 }, { 0.1, 1.1 } } })
  hl.curve("quick", { type = "bezier", points = { { 0.15, 0.85 }, { 0.25, 1.0 } } })
  hl.curve("overshot", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.08 } } })
  hl.curve("linearish", { type = "bezier", points = { { 0.3, 0.0 }, { 0.7, 1.0 } } })
  hl.curve("easeOutQuint", { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })

  hl.animation({ leaf = "windows", enabled = true, speed = 4, bezier = "smooth", style = "popin 95%" })
  hl.animation({ leaf = "windowsIn", enabled = true, speed = 4, bezier = "smooth", style = "popin 85%" })
  hl.animation({ leaf = "windowsOut", enabled = true, speed = 3, bezier = "quick", style = "popin 90%" })
  hl.animation({ leaf = "windowsMove", enabled = true, speed = 3, bezier = "quick" })

  hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "smooth", style = "slidefade 20%" })
  hl.animation({ leaf = "specialWorkspace", enabled = true, speed = 3, bezier = "smooth", style = "slidefadevert 5%" })

  hl.animation({ leaf = "layers", enabled = true, speed = 3, bezier = "quick", style = "fade" })
  hl.animation({ leaf = "layersIn", enabled = true, speed = 3, bezier = "quick", style = "popin 95%" })
  hl.animation({ leaf = "layersOut", enabled = true, speed = 3, bezier = "quick", style = "popin 95%" })
  hl.animation({ leaf = "fadeLayersIn", enabled = true, speed = 3, bezier = "linearish" })
  hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 3, bezier = "linearish" })

  hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "smooth" })

hl.config({
    dwindle = {
        preserve_split = true,
    },
})

hl.config({
    master = {
        new_status = "master",
    },
})

hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo   = false,
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        repeat_delay = 300, 
        repeat_rate  = 25,  

        follow_mouse = 1,

        sensitivity = 0, 

        touchpad = {
            natural_scroll = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + Space", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd([[sh -c 'grim -g "$(slurp)" - | swappy -f -']]))
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd("kitty --class floating-terminal -e nmtui"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("kitty --class floating-terminal -e bluetuith"))

hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))


for i = 1, 10 do
    local key = i % 10 
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("ALT + bracketright", hl.dsp.exec_cmd("pamixer -i 5"))
hl.bind("ALT + bracketleft", hl.dsp.exec_cmd("pamixer -d 5"))
hl.bind("ALT + Space", hl.dsp.exec_cmd("rofi -show drun"))
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, ["repeat"] = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { locked = true, ["repeat"] = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),  { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +5%"), { locked = true, ["repeat"] = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { locked = true, ["repeat"] = true })


--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

local suppressMaximizeRule = hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})

hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

hl.window_rule({
    name  = "thunar-blur-opacity",
    match = { class = "^thunar$" },
    opacity = 0.85, 0.85,
})

hl.window_rule({
    name  = "sublime-opacity",
    match = { class = "sublime_text" },
    opacity = 0.88, 0.88,
})

-------------------------
---- HELPER FUNCTION ----
-------------------------

local function hypr(keyword, args)
    local cmd = string.format("hyprctl keyword %s '%s'", keyword, args)
    os.execute(cmd)
end

--------------------------------
---- LAYER RULES ----
--------------------------------

hl.layer_rule({
    name = "waybar-blur",
    match = { namespace = "waybar" },
    blur = true,
})

hl.layer_rule({
    name = "rofi-blur",
    match = { namespace = "rofi" },
    blur = true,
})
