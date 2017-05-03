#-------------------------------------------------------------------------------
#
# ruby/cocoapods.zsh
# Command-line aliases for CocoaPods
#
#-------------------------------------------------------------------------------

lj info 'ruby/cocoapods.zsh'

# Install
alias pv='pod --version'
alias pi='pod install'
alias pil='LOCAL=1 bundle exec pod install'
alias piru='pod install --repo-update'
alias bpi='bundle exec pod install'
alias bpiru='bundle exec pod install --repo-update'
alias piv='pod install --verbose'
alias bpiv='bundle exec pod install --verbose'

# Outdated
# po - conflicts with omz alias (redefined in shell/antigen.zsh)
alias po='pod outdated --no-repo-update'
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

# Push/Publish
function pushmobilespec {
  # Optional first arg is spec file name
  if [[ -n $1 ]]; then
    spec_file="$1"
  else
    # Attempt to locate spec in current dir when not file name provided
    specs=($(ls -1 *.podspec | paste -sd " " -))
    spec_count=${#specs[@]}

    # If specs does not contain an array, spec_count will be a char count
    # if [[ ! $(declare -p specs 2> /dev/null | grep -q '^typeset \-a') ]]; then
    if (( spec_count == 1 )); then
      spec_file="${specs}"
    elif (( spec_count == 0 )); then
      echo "No podspecs found in the current directory."
      return 1
    else
      echo "Multiple podspecs found in the current directory (${spec_count}). Please specify which spec you would like to publish.\n  pushmobilespec Pod.podspec"
      return 2
    fi
  fi

  spec_repo_name="KPMobileSpecs"

  bundle exec pod repo push \
    "${spec_repo_name}" \
    "${spec_file}" \
    --sources=git@github.kp.org:internal-pods/specs,git@github.kp.org:mirrored-pods/specs,git@github.kp.org:F978034/KPMobileSpecs \
    --use-libraries \
    --private \
    --allow-warnings
}

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
