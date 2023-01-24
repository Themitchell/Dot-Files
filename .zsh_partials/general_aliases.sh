# General Aliases

alias be='bundle exec'
alias ls='ls -F'
alias ll='ls -lah'

alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

alias mkdir="mkdir -pv"

alias wget="wget -c"

getIp() {
  curl http://ipecho.net/plain; echo
}

updateIpForSshSecurityGroupRule() {
  sgId=$1
  sgrId=$2

  aws ec2 modify-security-group-rules \
    --group-id $sgId \
    --security-group-rules \
    "SecurityGroupRuleId=${sgrId},SecurityGroupRule={Description='andy.mitchell',CidrIpv4=$(getIp)/32,IpProtocol=tcp,FromPort=22,ToPort=22}" \
    --output text
}

updateIpForTestKitchenSshSecurityGroupRule() {
  echo "Adding IP to Test Kitchen security group"
  updateIpForSshSecurityGroupRule sg-037d44c4c5e73599d sgr-073247e42f1ada550
}

updateIpForPackerSshSecurityGroupRule() {
  echo "Adding IP to Packer security group"
  updateIpForSshSecurityGroupRule sg-0449a764c1bb00cc8 sgr-09130a9580c3359cf
}

updateSshIps() {
  updateIpForTestKitchenSshSecurityGroupRule
  updateIpForPackerSshSecurityGroupRule
}
