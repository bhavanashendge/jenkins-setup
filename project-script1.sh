echo "Building agent @ $1"
ssh $1 'wget -P /tmp https://apt.puppetlabs.com/puppet6-release-bionic.deb'
echo "Adding dpkg"
ssh $1  'sudo dpkg -i /tmp/puppet6-release-bionic.deb'
echo "Apt-get update"
ssh $1  'sudo apt-get update'
echo "Installing puppet-agent"
ssh $1  'sudo apt-get install puppet-agent'
echo "Adding host file entry as $2 puppet"
ssh $1  'echo ''192.168.1.200 puppet'' | sudo tee -a /etc/hosts'
echo "Running puppet agent with --test"
ssh $1  'sudo /opt/puppetlabs/bin/puppet agent --test &'
