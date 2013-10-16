class laptop_mode (
  $config           = $laptop_mode::params::config,
  $config_template  = $laptop_mode::params::config_template,
  $package_ensure   = $laptop_mode::params::package_ensure,
  $package_name     = $laptop_mode::params::package_name,
  $service_enable   = $laptop_mode::params::service_enable,
  $service_ensure   = $laptop_mode::params::service_ensure,
  $service_manage   = $laptop_mode::params::service_manage,
  $service_name     = $laptop_mode::params::service_name,
  $ltm_enable       = $laptop_mode::params::ltm_enable,
  $verbose_output   = $laptop_mode::params::ltm_verbose_output,
  $ltm_on_battery   = $laptop_mode::params::ltm_on_battery,
  $ltm_on_ac        = $laptop_mode::params::ltm_on_ac,
  $ltm_lid_closed   = $laptop_mode::params::ltm_lid_closed,
  $ltm_auto_modules = $laptop_mode::params::ltm_auto_modules,
  $ltm_min_battery  = $laptop_mode::params::ltm_min_battery,

) inherits laptop_mode::params {

  validate_absolute_path($config)
  validate_string($config_template)
  validate_string($package_ensure)
  validate_array($package_name)
  validate_bool($service_enable)
  validate_string($service_ensure)
  validate_bool($service_manage)
  validate_string($ltm_enable)
  validate_string($ltm_verbose_output)
  validate_string($ltm_on_battery)
  validate_string($ltm_on_ac)
  validate_string($ltm_lid_closed)
  validate_string($ltm_auto_modules)
  validate_string($ltm_min_battery)

  include '::laptop_mode::install'
  include '::laptop_mode::config'
  include '::laptop_mode::service'

  Class['::laptop_mode::install'] -> Class['::laptop_mode::config'] ~> Class['::laptop_mode::service']
}
