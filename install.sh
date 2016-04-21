#!/bin/bash -x
###
#Usage
# ./install.sh personal (for personal setup)
# ./install.sh (for vagrant setup)
###
# Install Chef
CHEFDIR=/var/chef/cookbooks

if [[ ! -f /usr/bin/chef-client && /usr/local/bin/chef-client && /usr/sbin/chef-client ]]; then
    curl https://omnitruck.chef.io/install.sh | sudo bash -s -- -c current -P chefdk
fi

# setup cookbooks directory
sudo mkdir -p /var/chef/cookbooks
sudo chmod -R 777 /var/chef/cookbooks

# Copy over the cookbooks
CDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -f ${CHEFDIR}/bootstrap_linux

cat > "${CHEFDIR}/Berksfile" <<EOF
source 'https://supermarket.chef.io'
cookbook "bootstrap_linux", path: "${CDIR}"
EOF

cd $CHEFDIR

# Install dependencies
berks vendor

# create client.rb file so that Chef client can find its dependant cookbooks
cat > "/var/chef/cookbooks/client.rb" <<EOF
cookbook_path File.join(Dir.pwd, 'berks-cookbooks')
EOF

# Run Chef
sudo chef-client -z -c "/var/chef/cookbooks/client.rb" -o bootstrap_linux
