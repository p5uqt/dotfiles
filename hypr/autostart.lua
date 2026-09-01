-------------------
---- AUTOSTART ----
-------------------

hl.on("hyprland.start", function ()
   hl.exec_cmd("waybar")
   hl.exec_cmd("swaync")
   hl.exec_cmd ("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
   hl.exec_cmd("awww-daemon")
   hl.exec_cmd("swayosd-server")
--   hl.exec_cmd("sleep 1 && /home/msi/.local/bin/wallpaper")
   hl.exec_cmd("wl-clip-persist --clipboard regular")
   hl.exec_cmd("eww open activate-linux")
   hl.exec_cmd("udiskie -f nautilus")
   hl.exec_cmd("hypridle")
--   hl.exec_cmd("hyprpm reload")
--   hl.exec_cmd("msi-perkeyrgb -m GS65 -s 00ffa9")
   hl.exec_cmd("~/.local/bin/msi-wsrgb --base 00ffa9 --ws FFFF00")
   hl.exec_cmd("batsignal -w 20 -c 15 -d 10 -I /usr/share/icons/Tela/24/panel/battery-010.svg")
end)
