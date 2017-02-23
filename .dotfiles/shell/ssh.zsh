#-------------------------------------------------------------------------------
#
# shell/ssh.zsh
# SSH command-line aliases
#
#-------------------------------------------------------------------------------

# Common Hosts
alias imac='ssh phatblat@imac.local'
alias mini='ssh phatblat@mini.log-g.co'
alias rundmg='ssh ben@rundmg.co.kp.org'
alias buildsrvpro='ssh admin@buildsrvpro.co.kp.org'
alias buildsrvpro2='ssh admin@buildsrvpro.ptc.ca.kp.org'
alias jenkinsdev='ssh f978034@cskpcloudxp1604.cloud.kp.org'
alias slave1='ssh admin@10.227.149.211'
alias cmpro='ssh admin@cmpro.ptc.ca.kp.org'
alias mobot2='ssh admin@RMGVIMACSVR002.co.kp.org'
alias mobot3='ssh admin@RMGVIMACSVR003.co.kp.org'
alias mobot4='ssh admin@RMGVIMACSVR004.co.kp.org'
alias realmdev='ssh f978034@cskpcloudxn0790.cloud.kp.org'


#-------------------------------------------------------------------------------
#
# SSh
#
#-------------------------------------------------------------------------------

# Aliases
alias sshshowpub='cat ~/.ssh/id_rsa.pub'
alias sshcopypub='pbcopy < ~/.ssh/id_rsa.pub'

# Functions

# sshkeyfingerprint
#
# Prints out information about a key in the following format:
# > sshkeyfingerprint [/Users/<USER>/.ssh/id_rsa.pub] 2048 SHA256:<PUBLIC_KEY> <COMMENT> (RSA)
#
# - arg $0 - Optional path to key file, defaults to ~/.ssh/id_rsa.pub
function sshkeyfingerprint {
  file=~/.ssh/id_rsa.pub;
  if (($+1)); then
    file="$1"
  fi

  echo -n "sshkeyfingerprint [${file}] "
  ssh-keygen -lf "${file}";
}

# sshnewkey
#
# Generates a new for use with outgoing SSH connections.
#
# - arg $0 - Optional key comment (typically user@hostname).
function sshnewkey {
  comment="${USER}@${HOST}"
  if (($+1)); then
    comment="$1"
  fi

  ssh-keygen -t rsa -C "${comment}"
}

# sshupload
#
# Uploads a public key to GitHub. Asks for authentication token before using curl to post the key.
#
# - arg $0 - Optional path to key file, defaults to ~/.ssh/id_rsa.pub
function sshupload {
  keyfile="~/.ssh/id_rsa.pub"
  if (($+1)); then
    keyfile="$1"
  fi

  # Upload default SSH key to GitHub
  echo "Uploading SSH public key to GitHub [${keyfile}]"
  echo -n "GitHub OTP code: "
  read otpcode
  curl -X POST \
    --user "phatblat" \
    --header "X-GitHub-OTP: ${otpcode}" \
    --data "{\"title\":\"${USER}@${HOST}_$(date +%Y%m%d%H%M%S)\",\"key\":\"$(cat $keyfile)\"}" \
    --verbose \
    "https://api.github.com/user/keys"
}
