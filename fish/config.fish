if status is-interactive

alias cd- "cd -"
alias icat="kitty +kitten icat"
alias cat bat
alias cls clear
alias lss "ls -a"
alias hashcap hcxpcapngtool
alias ls lsd
alias gpu='env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia'
alias cd.. "cd .."
alias v nvim
alias drag 'ripdrag -s 40 -n'
alias glow 'glow -t'
set -gx tide_character_vi_icon_default "❯"

end

# Added by LM Studio CLI tool (lms)
set -gx PATH $PATH /home/msi/.lmstudio/bin
