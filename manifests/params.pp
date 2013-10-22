class laptop_mode::params {

  $config_template   = 'laptop_mode/laptop_mode.conf.erb'
  $package_ensure    = 'present'
  $service_enable    = true
  $service_ensure    = 'running'
  $service_manage    = true

  case $::osfamily {
    'Debian': {
      $config          = '/etc/laptop-mode/laptop-mode.conf'
      $package_name    = [ 'laptop-mode-tools' ]
      $service_name    = 'laptop-mode'
    }
    'RedHat': {
      $config          = '/etc/laptop-mode/laptop-mode.conf'
      $package_name    = [ 'laptop-mode-tools' ]
      $service_name    = 'laptop-mode'
    }
    'SuSE': {
      $config          = '/etc/laptop-mode/laptop-mode.conf'
      $package_name    = [ 'laptop-mode-tools' ]
      $service_name    = 'laptop-mode'
    }
    'FreeBSD': {
      $config          = '/etc/laptop-mode/laptop-mode.conf'
      $package_name    = ['net/laptop_mode']
      $service_name    = 'laptop-mode'
    }
    'Archlinux': {
      $config          = '/etc/laptop-mode/laptop-mode.conf'
      $package_name    = [ 'laptop-mode-tools' ]
      $service_name    = 'laptop-mode'
    }
    'Linux': {
      # Account for distributions that don't have $::osfamily specific settings.
      case $::operatingsystem {
        'Gentoo': {
          $config          = '/etc/laptop-mode/laptop-mode.conf'
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
