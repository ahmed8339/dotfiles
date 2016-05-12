#-------------------------------------------------------------------------------
#
# ruby/cocoapods.zsh
# Command-line aliases for CocoaPods
#
#-------------------------------------------------------------------------------

# Install
alias pi='pod install'
alias bpi='bundle exec pod install'
alias bpiru='bundle exec pod install --repo-update'

alias piv='pod install --verbose'
alias bpiv='bundle exec pod install --verbose'

# Update
alias pu='pod update --no-repo-update'
alias bpu='bundle exec pod update --no-repo-update'
alias bpuru='bundle exec pod update'

# Repo Update
alias pru='pod repo update'
alias bepru='bundle exec pod repo update'

alias clearcpcache='rm -rf "${HOME}/Library/Caches/CocoaPods"'
