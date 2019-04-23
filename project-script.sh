echo "Building agent @ $1'
ssh $1 'wget -P /tmp https://apt.puppetlabs.com/puppet6-release-bionic.deb'
ssh $1  'sudo dpkg -i /tmp/puppet6-release-bionic.deb'
ssh $1  'sudo apt-get update'
ssh $1  'sudo apt-get install puppet-agent'
ssh $1  'echo ''$2 puppet'' | sudo tee -a /etc/hosts'
ssh $1  '/opt/puppetlabs/bin/puppet agent --waitforcert 20 --test &'
