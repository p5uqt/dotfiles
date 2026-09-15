export PATH="$HOME/.local/bin:$PATH"
pkill -f 'python[^ ]* .*msi-wsrgb'
sleep 0.5
msi-kbc --off
r=$(printf '%02x' "$(shuf -i 0-255 -n 1)"); colors="ff00$r ff${r}00 00ff$r ${r}ff00 00${r}ff ${r}00ff"; set -- $colors; msi-kbc --key space "$(printf '%s\n' "$@" | shuf -n 1)"
