------------------------
--- Monitor settings ---
------------------------

hl.monitor({
    output = "DP-2",
    mode = "2560x144@240",
    position = "0x0",
    scale = 1
    })

hl.monitor({
    output = "DP-3",
    mode = "2560x144@240",
    position = "2560x0",
    scale = 1
    })


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
