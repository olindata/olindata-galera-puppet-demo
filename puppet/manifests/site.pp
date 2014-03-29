node master.olindata.vm {
  include role::master
}

node galera000.olindata.vm {
  include role::db::galeramaster
}

node /^galera\d{3}.olindata.vm$/ {
  include role::db::galera
}