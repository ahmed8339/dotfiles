#-------------------------------------------------------------------------------
#
# ruby/cocoapods.zsh
# Command-line aliases for CocoaPods
#
#-------------------------------------------------------------------------------

# Install
alias pv='pod --version'
alias pi='pod install'
alias pil='LOCAL=1 pod install'
alias piru='pod install --repo-update'
alias bpi='bundle exec pod install'
alias bpiru='bundle exec pod install --repo-update'
alias piv='pod install --verbose'
alias bpiv='bundle exec pod install --verbose'

# Outdated
# po - conflicts with popd short alias
#alias po='pod outdated --no-repo-update'
alias bpo='bundle exec pod outdated --no-repo-update'

# Update
alias pu='pod update --no-repo-update'
alias pul='LOCAL=1 pod update'
alias bpu='bundle exec pod update --no-repo-update'
alias bpuru='bundle exec pod update'

# Repo Update
alias pru='pod repo update'
alias bpru='bundle exec pod repo update'
alias prum='pod repo update master'
alias bprum='bundle exec pod repo update master'

# Lint
alias pll='pod lib lint'
alias pllvnc='pod lib lint --verbose --no-clean'
alias lintlib='pod lib lint --sources=git@github.kp.org:internal-pods/specs,git@github.kp.org:mirrored-pods/specs,git@github.kp.org:internal-pods/development-specs,git@github.kp.org:F978034/KPMobileSpecs --use-libraries --private --allow-warnings'

# Maintenance
alias listpodrepos='pushd ~/.cocoapods/repos > /dev/null && \
  for dir in *; do
    echo $dir
    pushd $dir > /dev/null
    git remote -v
    popd > /dev/null
  done && \
  popd > /dev/null'
alias clearcpcache='rm -rf "${HOME}/Library/Caches/CocoaPods"'
