class role::db::galeramaster inherits role::db::galera {
  include profile::haproxy::galera
}