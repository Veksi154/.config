-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- HYPRLAND CONFIG FILE                                  --
-- EDIT THIS CONFIG ACCORDING TO THE WIKI INSTRUCTIONS.  --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Refer to the wiki for more information.
-- https://wiki.hypr.land/configuring/

require("common.environment")
require("common.permissions")
require("common.autostart")
require("common.look-and-feel")
require("common.keybindings")
require("common.workspace_rules")

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- LOAD HOST BASED CONFIGURATION FILES                   --
-- ADD HOST SPECIFIC CONFIGURATION FILES TO THE HOST VAR.--
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- To use a host specific configuration add a configuration
-- file in the host/ directory. After that you can link the
-- file to your computer hostname in the host variable.

-- All changes made in the host configuration file will
-- overrule default configurations


local host = {
    ["quantum"] = "host.quantum",
    ["voyager"] = "host.voyager"
}

-- DO NOT EDIT AFTER THIS --

local function get_hostname()
    local f = io.open("/etc/hostname", "r")
    if not f then return "unknown" end
    local name = f:read("*l") or "unknown"
    f:close()
    return name:gsub("%s+", "")
end

local hostname = get_hostname()
local host_module = host[hostname] or "host.default"

require(host_module)