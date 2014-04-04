class profile::mcollective {

  # TODO: Things that have to be done manually at present:
  # 1. edit /usr/sbin/mcollectived and update the ruby interpreter on the first line to ruby1.8
  
  # include mcollective
  class { '::mcollective': }
  
  $mco_plugins = hiera_hash('profile::mcollective::plugins')
  create_resources('mcollective::plugin', $mco_plugins)

}