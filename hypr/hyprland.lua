-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- HYPRLAND CONFIG FILE                                  --
-- EDIT THIS CONFIG ACCORDING TO THE WIKI INSTRUCTIONS.  --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- Refer to the wiki for more information.
-- https://wiki.hypr.land/configuring/

-------------------
---- AUTOSTART ----
-------------------

require("common.autostart")

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

-----------------------
---- LOOK AND FEEL ----
-----------------------

require("common.look-and-feel")

---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "fi",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

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

-- Example per-device config
-- See https://wiki.hypr.land/configuring/core/devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})

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