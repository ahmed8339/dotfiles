#
# ~/.config/fish/config.fish
# Dotfiles
#

# Fish logo
if status is-interactive
    logo
end

# Variables
source ~/.config/fish/variables.fish

# Directory-based variables
eval (direnv hook fish)

# Termial colors
set fish_color_autosuggestion 555\x1eyellow
set fish_color_command 005fd7\x1epurple
set fish_color_comment red
set fish_color_cwd green
set fish_color_cwd_root red
set fish_color_error red\x1e\x2d\x2dbold
set fish_color_escape cyan
set fish_color_history_current cyan
set fish_color_host \x2do\x1ecyan
set fish_color_match cyan
set fish_color_normal normal
set fish_color_operator cyan
set fish_color_param 00afff\x1ecyan
set fish_color_quote brown
set fish_color_redirection normal
set fish_color_search_match \x2d\x2dbackground\x3dpurple
set fish_color_status red
set fish_color_user \x2do\x1egreen
set fish_color_valid_path \x2d\x2dunderline
set fish_greeting \x1d
set fish_key_bindings fish\x5fdefault\x5fkey\x5fbindings
set fish_pager_color_completion normal
set fish_pager_color_description 555\x1eyellow
set fish_pager_color_prefix cyan
set fish_pager_color_progress cyan

# GUI and items requiring a user
if status is-interactive
    # Powerline
    if which -s powerline-daemon
        # Not sure why these are needed, but they appear in several fish examples
        set --export POWERLINE_BASH_CONTINUATION    1
        set --export POWERLINE_BASH_SELECT          1

        # http://powerline.readthedocs.io/en/latest/commands/daemon.html
        powerline-daemon --quiet

        # https://computers.tutsplus.com/tutorials/getting-spiffy-with-powerline--cms-20740#highlighter_632634

        # Python setup so we can start powerline
        for python_version in 3.6 # 2.7
            # Include system and user packages
            for python_bin_path in /usr/local/lib/python$python_version/site-packages \
                                   ~/Library/Python/$python_version/bin
                if test -d $python_bin_path
                    set --export --global PATH $PATH $python_bin_path
                    if test -d $python_bin_path/powerline/bindings/fish
                        set fish_function_path $fish_function_path $python_bin_path/powerline/bindings/fish
                    end
                end
            end
        end

        powerline-setup # fish function in powerline/bindings/fish
    end

    # Use custom autoloaded functions
    reload fish_mode_prompt
    reload fish_right_prompt

    # Event Hooks
    reload fish_postexec

    # The Fuck
    eval (thefuck --alias | tr \n ';')
end
