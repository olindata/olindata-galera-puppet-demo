class profile::network {
  # set up base network stuff
  #  include ::network

  # load other network interfaces from hiera
  #  $networks = hiera_hash('networks', undef)

  #  if $networks {
  #  create_resources('network::interface', $networks)
  #} else {
  #  fail('No network settings found in hiera in class profile::network.')
  #}

}
