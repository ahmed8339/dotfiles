#-------------------------------------------------------------------------------
#
# shell/ssh.zsh
# SSH command-line aliases
#
#-------------------------------------------------------------------------------

# Common Hosts
alias imac='ssh phatblat@imac.local'
alias buildsrvpro='ssh admin@buildsrvpro.co.kp.org'
alias mini='ssh phatblat@mini.log-g.co'

# SSH Utility Aliases
alias sshshowpub='cat ~/.ssh/id_rsa.pub'
alias sshcopypub='pbcopy < ~/.ssh/id_rsa.pub'

function sshkeyfingerprint() {
  file=~/.ssh/id_rsa.pub;
  if (($+1)); then
    file="$1"
  else
    file=~/.ssh/id_rsa.pub
  fi
  echo -n "sshkeyfingerprint [${file}] "
  ssh-keygen -lf "${file}";
}
alias sshkeyfingerprint=sshkeyfingerprint

alias sshnewkey=sshnewkey
function sshnewkey() {
  if (($+1)); then
    ssh-keygen -t rsa -C "$1"
  else
    ssh-keygen -t rsa -C "${USER}@${HOST}"
  fi
}

function sshupload() {
  # Upload default SSH key to GitHub
  echo "Uploading SSH public key to GitHub"
  echo -n "GitHub OTP code: "
  read otpcode
  curl -X POST \
    --user "phatblat" \
    --header "X-GitHub-OTP: ${otpcode}" \
    --data "{\"title\":\"${USER}@${HOST}_$(date +%Y%m%d%H%M%S)\",\"key\":\"$(cat ~/.ssh/id_rsa.pub)\"}" \
    --verbose \
    https://api.github.com/user/keys
}
alias sshupload=sshupload
