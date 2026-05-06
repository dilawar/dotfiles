if status is-interactive
end

set -g fish_key_bindings fish_vi_key_bindings

starship completions fish | source
# Commands to run in interactive sessions can go here
alias vim="nvim"
alias v="nvim"
set -Ux EDITOR nvim

fish_add_path -g ~/.local/bin
fish_add_path -g ~/.cargo/bin

if test -f ~/.cargo/env.fish
    source ~/.cargo/env.fish
end

source ~/.config/fish/env.fish
