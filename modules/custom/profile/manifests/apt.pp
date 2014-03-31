class profile::apt {
  # include base aptitude class
  include ::apt

  # get keys from hiera and create them
  $keys = hiera_hash('profile::apt::keys', undef)
  if ($keys) {
    create_resources('apt::key', $keys)
  }

  # get repos from hiera and create them
  $repositories = hiera_hash('profile::apt::repositories', undef)
  if ($repositories) {
    create_resources('apt::source', $repositories)
  }

}
