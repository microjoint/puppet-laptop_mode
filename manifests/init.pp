class laptop_mode (
  $config           = $laptop_mode::params::config,
  $config_template  = $laptop_mode::params::config_template,
  $package_ensure   = $laptop_mode::params::package_ensure,
  $package_name     = $laptop_mode::params::package_name,
  $service_enable   = $laptop_mode::params::service_enable,
  $service_ensure   = $laptop_mode::params::service_ensure,
  $service_manage   = $laptop_mode::params::service_manage,
  $service_name     = $laptop_mode::params::service_name,

) inherits laptop_mode::params {

  validate_absolute_path($config)
  validate_string($config_template)
  validate_string($package_ensure)
  validate_array($package_name)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)

  include '::laptop_mode::install'
  include '::laptop_mode::config'
  include '::laptop_mode::service'

  Class['::laptop_mode::install'] -> Class['::laptop_mode::config'] ~> Class['::laptop_mode::service']
}
