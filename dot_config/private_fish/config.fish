if status is-interactive
end

set -g fish_key_bindings fish_vi_key_bindings

# Commands to run in interactive sessions can go here
alias vim="nvim"
alias v="nvim"
set -Ux EDITOR nvim

fish_add_path -g ~/.local/bin
fish_add_path -g ~/.cargo/bin
fish_add_path -g ~/Scripts/

# 
# This takes a long time to load, so I have it in a separate file that I can source when needed
#
# source ~/.config/fish/env.tcin-aws.fish

starship completions fish | source
