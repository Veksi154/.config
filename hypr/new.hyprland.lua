-- Monitor settings

hl.monitor({ output = "DP-2", mode = "2560x144@240", position = "0x0", scale = 1, cm = "cm_auto_hdr", })
hl.monitor({ output = "DP-3", mode = "2560x144@240", position = "2560x0", scale = 1, cm = "cm_auto_hdr", })

-- Primarty DP workspace_rules
hl.workspace_rule({ workspace = "1", monitor = "DP-2", })
hl.workspace_rule({ workspace = "2", monitor = "DP-2", })
hl.workspace_rule({ workspace = "3", monitor = "DP-2", })
hl.workspace_rule({ workspace = "4", monitor = "DP-2", })
hl.workspace_rule({ workspace = "5", monitor = "DP-2", })

-- Secondary DP workspace_rules
hl.workspace_rule({ workspace = "6", monitor = "DP-3", })
hl.workspace_rule({ workspace = "7", monitor = "DP-3", })
hl.workspace_rule({ workspace = "8", monitor = "DP-3", })
hl.workspace_rule({ workspace = "9", monitor = "DP-3", })
hl.workspace_rule({ workspace = "10", monitor = "DP-3", })

-- Program variables
local terminal = "kitty"
local fileManager =  "dolphin"
local menu = "wofi --show drun"
local browser = "zen-browser"

-- Autostart programs
hl.on("hyprland.start", function ()
    hl.exec_cmd("hyprpaper & swaync & waybar")
    hl.exec_cmd("keepassxc", {workspace = "10 silent"})
end)

-- Keybinds
hl.bind("SUPER + C", hl.dsp.window.close())jd
hl.bind("SUPER + Q", hl.dsp.exec_cmd(terminal))
hl.bind("SUPER + F", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + SHIFT + F", hl.dsp.exec_cmd(browser "--private-window"))
hl.bind("SUPER + R", hl.dsp.exec_cmd(menu))
hl.bind("SUPER + E", hl.dsp.exec_cmd(fileManager))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
