class laptop_mode::params {

  $config_template   = 'laptop_mode/laptop_mode.conf.erb'
  $package_ensure    = 'present'
  $service_enable    = true
  $service_ensure    = 'running'
  $service_manage    = true
  $config          = '/etc/laptop-mode'

  case $::osfamily {
    'Debian': {
      $package_name    = [ 'laptop-mode-tools' ]
      $service_name    = 'laptop-mode'
    }
    'RedHat': {
      $package_name    = [ 'laptop-mode-tools' ]
      $service_name    = 'laptop-mode'
    }
    'SuSE': {
      $package_name    = [ 'laptop-mode-tools' ]
      $service_name    = 'laptop-mode'
    }
    'FreeBSD': {
      $package_name    = ['net/laptop_mode']
      $service_name    = 'laptop-mode'
    }
    'Archlinux': {
      $package_name    = [ 'laptop-mode-tools' ]
      $service_name    = 'laptop-mode'
    }
    'Linux': {
      # Account for distributions that don't have $::osfamily specific settings.
      case $::operatingsystem {
        'Gentoo': {
          $package_name    = ['net-misc/laptop_mode']
          $service_name    = 'laptop-mode'
        }
        default: {
          fail("The ${module_name} module is not supported on an ${::operatingsystem} distribution.")
        }
      }
    }
    default: {
      fail("The ${module_name} module is not supported on an ${::osfamily} based system.")
    }
  }
}
