#
class laptop_mode::config inherits laptop_mode {

  file { $config:
    ensure    => directory,
    owner     => 0,
    group     => 0,
    mode      => '0644',
    source    => 'puppet:///modules/laptop_mode/',
    recurse   => remote
  }

}
