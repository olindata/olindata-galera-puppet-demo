class profile::base {
  # install and configure augeas
  include ::augeas

  # configure ssh
  include ::ssh

  #include ::rsyslog::client

  # configure ntp
  include ::ntp

  # include network settings, interfaces etc.
  include profile::network

  # export host resources from all other servers
  @@host { $::fqdn:
    ensure       => present,
    ip           => $::ipaddress,
    host_aliases => $::hostname,
  }

  # collect exported host resources from other servers
  Host <<| |>>

  # depending on the OS, include apt or yum repos
  case $::osfamily {
    'debian' : { include profile::apt }
    'redhat' : { include profile::yum }
  }

  # make sure some of the base packages are present
  package { 'vim': ensure => present, }
  package { 'screen': ensure => present, }

}
