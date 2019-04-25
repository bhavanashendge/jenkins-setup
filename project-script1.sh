echo "Building agent @ $1"
ssh $1 'wget -P /tmp https://apt.puppetlabs.com/puppet6-release-bionic.deb'
echo "Adding dpkg"
ssh $1  'sudo dpkg -i /tmp/puppet6-release-bionic.deb'
echo "Apt-get update"
ssh $1  'sudo apt-get update'
echo "Installing puppet-agent"
ssh $1  'sudo apt-get install puppet-agent'
echo "Adding host file entry as $2 puppet"
ssh $1  'echo ''$2 puppet'' | sudo tee -a /etc/hosts'
echo "Adding dpkg"
ssh $1  '/opt/puppetlabs/bin/puppet agent --waitforcert 20 --test &'
