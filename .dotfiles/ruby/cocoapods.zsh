#-------------------------------------------------------------------------------
#
# ruby/cocoapods.zsh
# Command-line aliases for CocoaPods
#
#-------------------------------------------------------------------------------

# CocoaPods
alias pi='pod install --no-repo-update'
alias bpi='bundle exec pod install --no-repo-update'
alias bpii='bundle exec pod install'
alias piv='pod install --no-repo-update --verbose'
alias bpiv='bundle exec pod install --no-repo-update --verbose'
alias bpu='bundle exec pod update'

alias clearcpcache='rm -rf "${HOME}/Library/Caches/CocoaPods"'
