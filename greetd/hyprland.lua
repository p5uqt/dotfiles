hl.monitor({
    output   = "eDP-1",
    mode     = "1920x1080@240",
    position = "auto",
    scale    = "1",
})

hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")

hl.on("hyprland.start", function()
	hl.exec_cmd("regreet; hyprctl dispatch exit")
end)
hl.config({
	misc = {
		disable_hyprland_logo = true,
		disable_splash_rendering = true,
		disable_hyprland_guiutils_check = true,
	},
})
