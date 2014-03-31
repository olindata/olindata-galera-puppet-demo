class profile::haproxy::galera {
  include ::haproxy

  # Make sure the wheezy backports repo is present before attempting the package
  if $::lsbdistcodename == 'wheezy' {
    Apt::Source['wheezy-backports'] -> Package['haproxy']
  }

  # load haproxy frontends
  $listens = hiera_hash('profile::haproxy::galera::listen', undef)

  if $listens {
    create_resources('haproxy::listen', $listens)
  } else {
    fail('No listen settings found in hiera in class profile::haproxy::galera.')
  }

}
