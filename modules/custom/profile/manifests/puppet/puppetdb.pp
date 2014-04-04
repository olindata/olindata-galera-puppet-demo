class profile::puppet::puppetdb {
  # Configure puppetdb and its underlying database
  include ::puppetdb

  # Configure the puppet master to use puppetdb
  include ::puppetdb::master::config

}