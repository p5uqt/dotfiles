-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
   hl.exec_cmd("elephant")
   hl.exec_cmd("waybar")
   hl.exec_cmd("GSK_RENDERER=gl swaync")
   hl.exec_cmd ("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
   hl.exec_cmd("awww-daemon")
   hl.exec_cmd("GSK_RENDERER=gl swayosd-server")
   hl.exec_cmd("wl-clip-persist --clipboard regular")
   hl.exec_cmd("eww open activate-linux")
   hl.exec_cmd("udiskie -f nautilus")
   hl.exec_cmd("hypridle")
   hl.exec_cmd("~/.local/bin/msi-wsrgb --base 00ffa9 --ws FFFF00")
   hl.exec_cmd("batsignal -w 20 -c 15 -d 10 -I /usr/share/icons/Tela/24/panel/battery-010.svg")
   hl.exec_cmd = ("wl-paste --type text --watch cliphist store")
   hl.exec_cmd = ("wl-paste --type image --watch cliphist store")
end)
