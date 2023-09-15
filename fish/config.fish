if status is-interactive
    # Commands to run in interactive sessions can go here
end
starship init fish | source

#set PATH /opt/anaconda/bin $PATH
set -x FONTCONFIG_PATH /etc/fonts
set -x ANDROID_HOME /home/jami/Android/Sdk
set -x PATH $PATH /home/jami/go
set -x PATH $PATH /home/jami/go/bin
set -U fish_greeting ""
#set -x PYTHON /usr/bin/python3.8

nerdfetch

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/jami/miniconda3/bin/conda
    eval /home/jami/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
