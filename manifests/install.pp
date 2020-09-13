#
class logwatch::install (
  $package_ensure = $logwatch::package_ensure,
  $package_name   = $logwatch::package_name,
) {

  package { 'logwatch':
    ensure => $package_ensure,
    name   => $package_name,
  }

}
