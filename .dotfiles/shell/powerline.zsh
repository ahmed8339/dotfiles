#-------------------------------------------------------------------------------
#
# powerline.zsh
# Powerline configuration
#
#-------------------------------------------------------------------------------
export POWERLINE_HOME=/usr/local/lib/python2.7/site-packages/powerline
export POWERLINE_CONFIG_PATHS=$HOME/.powerline

export DEFAULT_USER="phatblat"

# Powerline
powerline-daemon -q
. ${POWERLINE_HOME}/bindings/zsh/powerline.zsh

alias powerlinetest='echo "⮀ ± ⭠ ➦ ✔ ✘ ⚡"'
