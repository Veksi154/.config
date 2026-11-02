-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- WINDOW AND WORKSPACE RULES                            --
-- CONFIGURE WINDOW AND WORKSPACE RULES                  --
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

-- See https://wiki.hypr.land/configuring/core/rules/

-- Example window rules that are useful


local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
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

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule

-- Workspaces can work differently depending on the amount of
-- monitors. For example:
--
--  - If you have only one monitor all the workspaces from 1-
--    10 are on the same monitor
--
--  - If you have 2 monitors workspaces are divided with 1-5 
--    on the lef and 6-10 on the right

hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },

    move  = "20 monitor_h-120",
    float = true,
})

local M = {}

local function sorted_monitors()
    local list = {}
    for _, m in ipairs(hl.get_monitors()) do
        table.insert(list, m)
    end

    table.sort(list, function(a, b) return a.position.x < b.position.x end)
    return list
end

local function rules_single(mon)
    for i = 1, 10 do
        hl.workspace_rule({
            workspace = tostring(i),
            monitor = mon.name,
            default = (i == 1)
        })
    end
end

local function rules_multi(left, right)
  for i = 1, 5 do
    hl.workspace_rule({
      workspace  = tostring(i),
      monitor    = left.name,
      default    = (i == 1),
    })
  end
  for i = 6, 10 do
    hl.workspace_rule({
      workspace  = tostring(i),
      monitor    = right.name,
      default    = (i == 6),
    })
  end
end

function M.apply()
  local mons = sorted_monitors()
  if #mons == 0 then return end

  if #mons == 1 then
    rules_single(mons[1])
  else
    rules_multi(mons[1], mons[2])
  end
end

M.apply()
hl.on("monitor.added", M.apply)
hl.on("monitor.layout_changed", M.apply)

return M