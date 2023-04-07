if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source

set PATH /opt/anaconda/bin $PATH
set -x FONTCONFIG_PATH /etc/fonts
set -U fish_greeting ""

nerdfetch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/anaconda/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

