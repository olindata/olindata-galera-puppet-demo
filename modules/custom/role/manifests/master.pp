# Class: role::master
#
#
class role::master {
  include profile::puppet::master
  include profile::puppet::puppetdb
  include profile::foreman

}