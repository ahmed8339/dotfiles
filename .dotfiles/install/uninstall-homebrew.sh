#-------------------------------------------------------------------------------
#
# install/uninstall-homebrew.sh
# Repeatable script which removes command-line tools no longer desired
#
#-------------------------------------------------------------------------------

echo
echo ">>> uninstall-homebrew"
echo

#-------------------------------------------------------------------------------

formulae=(
  hub
)

brew uninstall ${formulae[*]}