#/bin/bash
echo '===> settign up /etc/hosts and /etc/resolv.conf'
echo 192.168.56.20 master.olindata.vm master puppet >> /etc/hosts
echo nameserver 8.8.8.8 > /etc/resolv.conf
echo '===> cloning puppet repo'
git clone https://github.com/olindata/perconalive2014-demo.git /etc/puppet
cd /etc/puppet
echo '===> pulling git submodules'
git submodule update --init
echo '===> setting up yum repos'
cd ~; wget http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm; yum install -y puppetlabs-release-el-6.noarch.rpm
wget -O/etc/yum.repos.d/scl.repo http://dev.centos.org/centos/6/SCL/scl.repo
echo '===> installing puppet'
yum install -y puppet-server puppet puppetdb puppetdb-terminus
echo '===> starting puppetmaster'
service puppetmaster start