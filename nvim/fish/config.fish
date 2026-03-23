if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Using eza to add icons on executing ls command
if type -q eza
    alias ls 'eza --icons --group-directories-first'
    alias ll 'eza -l --icons --git --group-directories-first'
    alias la 'eza -a --icons --group-directories-first'
    alias lla 'eza -la --icons --git --group-directories-first'
    alias tree 'eza --tree --icons'
end

# Initialize Starship
if type -q starship
    starship init fish | source
end
