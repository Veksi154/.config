-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- HYPRLAND CONFIG FILE                                  --
-- EDIT THIS CONFIG ACCORDING TO THE WIKI INSTRUCTIONS.  --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Refer to the wiki for more information.
-- https://wiki.hypr.land/configuring/

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/configuring/core/environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/configuring/core/advanced-configuration/permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")

-------------------
---- AUTOSTART ----
-------------------

require("common.autostart")

-----------------------
---- LOOK AND FEEL ----
-----------------------

require("common.look-and-feel")

---------------------
---- KEYBINDINGS ----
---------------------

require("common.keybindings")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------
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