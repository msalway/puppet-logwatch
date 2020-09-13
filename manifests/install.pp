# @summary private class to install logwatch
#
# @param package_ensure
#   The ensure parameter to pass to the package resource
#
# @param package_name
#   The name of the package to pass to the package resource
#
class logwatch::install (
  String[1] $package_ensure = $logwatch::package_ensure,
  String[1] $package_name   = $logwatch::package_name,
) {

  package { 'logwatch':
    ensure => $package_ensure,
    name   => $package_name,
  }

}
