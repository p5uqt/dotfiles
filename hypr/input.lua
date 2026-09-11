---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "us,ru",
        kb_variant = "",
        kb_model   = "",
        kb_options = "grp:caps_toggle, altwin:swap_lalt_lwin",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            natural_scroll = true,
            disable_while_typing = false,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

hl.gesture({
    fingers = 4,
    direction = "down",
    action = function() os.execute("systemctl poweroff") end })

hl.gesture({
    fingers = 4,
    direction = "up",
    action = function() os.execute("systemctl reboot") end })


-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices>
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})
