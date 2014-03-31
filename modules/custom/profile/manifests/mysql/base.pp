class profile::mysql::base {
  # TODO: Things that have to be done manually at present:
  # 1. edit the /etc/mysql/debian.cnf and update the socket location
  # 2. mv /var/lib/mysql/{mysql,performance_schema} /mysql/data/
  # 3. aptitude install mariadb-client-5.5

  # install mysql client
  include mysql::client

  # the base profile contains logic to choose either profile::apt or profile::yum
  Class['profile::base'] ~> Package['mysql_client']
  Class['profile::base'] ~> Package['percona-toolkit']
  Class['profile::base'] ~> Package['mysql-server']

  # load the mysql options from hiera and pass them to mysql::server
  $override_options = hiera_hash('profile::mysql::base::override_options', undef)

  if $override_options {
    class { 'mysql::server':
      override_options => $override_options,
      require          => [Package['mysql_client']]
    }
  } else {
    # we don't use default options, so error if nothing is found
    fail('No hash found in hiera to override default mysql settings in class profile::mysql::base.')
  }

  # make sure percona toolkit and xtrabackup are present
  package { 'percona-toolkit': ensure => latest, }

  package { 'xtrabackup':
    ensure  => latest,
    require => Class['profile::apt'],
  }
}
