node 'master.olindata.vm' {
  # this server is a puppetmaster
  include role::master
}

node 'galera000.olindata.vm' {
  # this server will be a galera node, also having an haProxy instance
  include role::db::galeramaster
}

node /^galera\d{3}.olindata.vm$/ {
  # all other nodes are galera nodes
  include role::db::galera
}
