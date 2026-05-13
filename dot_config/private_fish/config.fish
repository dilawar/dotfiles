if status is-interactive
end

set -g fish_key_bindings fish_vi_key_bindings

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

# 
# This takes a long time to load, so I have it in a separate file that I can source when needed
#
# source ~/.config/fish/env.tcin-aws.fish

starship completions fish | source

function reset_ssh_agent --description "Restart SSH agent and load the default Git key"
    set -e SSH_AUTH_SOCK
    set -e SSH_AGENT_PID

    ssh-agent -c | sed 's/^setenv /set -gx /; s/;$//' | source
    ssh-add --apple-use-keychain ~/.ssh/id_ed25519
end
