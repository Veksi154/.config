-- See https://wiki.hypr.land/configuring/core/autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:

local prog = require("common.programs")

hl.on("hyprland.start", function () 
  -- hl.exec_cmd(prog.terminal)
  -- hl.exec_cmd("nm-applet")
  hl.exec_cmd("waybar & hyprpaper & swaync")
  hl.exec_cmd("keepassxc", {workspace = "10 silent"})
  hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)


