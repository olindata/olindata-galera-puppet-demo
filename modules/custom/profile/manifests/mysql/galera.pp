class profile::mysql::galera {
  include profile::mysql::base

  include ::galera

  include galera::health_check

  # load haproxy frontends
  $balancermembers = hiera_hash('profile::mysql::galera::balancermembers', undef)

  if $balancermembers {
    create_resources('@@haproxy::balancermember', $balancermembers)
  }

}
