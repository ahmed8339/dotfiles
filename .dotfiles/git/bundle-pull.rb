#-------------------------------------------------------------------------------
#
# bundle.rb
# Functions for complex git-bundle actions
#
#-------------------------------------------------------------------------------

require 'pathname'
require 'net/ssh' # gem install net-ssh

# bundle-pull
#
# Usage: bundle-pull
#
# Ensure clean work tree before start, abort if dirty.
#
# - SSH in
# - stash changes (snapshot)
# - get HEAD SHA
# - git stash
# - get stash SHA
# - bundle create (& verify)
# - end SSH
# - git fetch OTHER_HOST $USER/REPO_PATH/BUNDLE_FILE bundle_branch
#   - User dir is used as root (so can't get to system files, less typing)
def bundle_pull()
  command = 'bundle-pull'
  bundle_name = 'snapshot.bundle'

  # Ensure current dir is in a clean git repo
  if !`git rev-parse --is-inside-work-tree >/dev/null 2>&1`
      puts "The #{command} command must be run inside a git repo"
      return
  end

  # TODO: Remove ! when done testing
  if !`git status --porcelain`
      puts "The work tree is dirty, aborting."
      return
  end

  # determine remote_hostname
  username = ENV['USER']
  # puts "username: #{username}"

  hostname = `hostname`
  case
      when 'octoair.local'
          remote_hostname = 'imac.local'
      when 'imac.local'
          remote_hostname = 'octoair.local'
  end
  # puts "remote_hostname: #{remote_hostname}"

  repo_path = Dir.pwd
  # puts repo_path
  if !repo_path.start_with? "/Users/#{username}"
      puts 'This command can only be ran under your home directory.'
  end

  # SSH
  puts "ssh://#{username}@#{remote_hostname}:#{repo_path}"

  # put commands to send to the remote Ruby here...
  commands = [
    # '/usr/bin/which ruby -v',

    # Move into repo dir
    "cd #{repo_path}",
    'pwd',

    # Clean out previous bundle, if necessary

    # Snapshot
    'head_sha=$(git rev-parse HEAD)',
    'echo "HEAD: ${head_sha}"',
    'git stash list',
    # 'git stash list -p', # verbose diff of stash
    'git stash save "snapshot: $(date)"',

    # Returns only the SHA of the last stash (will need the next one back in history in order to restore staging area status)
    "snapshot_sha=$(git show --abbrev-commit --oneline refs/stash@{0} | head -1 | awk '{print $1}')",
    'echo "snapshot: ${snapshot_sha}"',

    # Restore the dirty work tree
    'git stash apply "stash@{0}"',

    # Create bundle
    'git tag -d snapshot_end',
    'git tag snapshot_end ${snapshot_sha}',
    "git bundle create #{bundle_name} HEAD..snapshot_end",
    "git bundle verify #{bundle_name}"
  ]

  Net::SSH.start(remote_hostname, username) do |ssh|

    command_string = commands.join(" && ")
    output = ssh.exec!(command_string).chomp
    puts output

  end

end # bundle_pull()

bundle_pull()
