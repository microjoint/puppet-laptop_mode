#
class laptop_mode::install inherits laptop_mode {

  package { 'laptop_mode':
    ensure => $package_ensure,
    name   => $package_name,
  }

}
