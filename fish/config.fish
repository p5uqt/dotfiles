if status is-interactive

alias cd- "cd -"
alias icat="kitty +kitten icat"
alias cat bat
alias cls clear
alias lss "ls -a"
alias hashcap hcxpcapngtool
alias ls lsd
alias gpu='env __NV_PRIME_RENDER_OFFLOAD=0 __GLX_VENDOR_LIBRARY_NAME=mesa'
alias cd.. "cd .."
alias v nvim
alias drag 'GSK_RENDERER=gl ripdrag -s 40 -n'
alias glow 'glow -t'
alias tree 'eza --tree'
alias e 'zk edit --interactive'
alias l 'zk list'
alias n 'zk new'
alias ss 'grc ss'
alias journalctl 'grc journalctl'
alias lsblk 'grc lsblk'
alias free 'grc free'


set -gx tide_character_vi_icon_default "❯"

end


# Added by LM Studio CLI tool (lms)
set -gx PATH $PATH /home/msi/.lmstudio/bin

# strix
fish_add_path /home/msi/.strix/bin

# OpenClaw Completion
test -f "/home/msi/.openclaw/completions/openclaw.fish"; and source "/home/msi/.openclaw/completions/openclaw.fish"
