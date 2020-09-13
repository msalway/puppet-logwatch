# == Class: logwatch
#
# This class configures Logwatch
#
# Parameters
# $output
# $format
# $mail_to
# $mail_from
# $range
# $detail
# $service
# $package_ensure
# $package_name
#
class logwatch (
  Enum['stdout','file','mail','unformatted'] $output         = $logwatch::params::output,
  Enum['text','html']                        $format         = $logwatch::params::format,
  Array[String[1]]                           $mail_to        = $logwatch::params::mail_to,
  String[1]                                  $mail_from      = $logwatch::params::mail_from,
  Enum['All','Today','Yesterday']            $range          = $logwatch::params::range,
  Enum['Low','Med','High']                   $detail         = $logwatch::params::detail,
  Array[String[1]]                           $service        = $logwatch::params::service,
  String[1]                                  $package_ensure = $logwatch::params::package_ensure,
  String[1]                                  $package_name   = $logwatch::params::package_name,
  Stdlib::Unixpath                           $ignore_conf    = $logwatch::params::ignore_conf,
) inherits logwatch::params {
  contain logwatch::install
  contain logwatch::config

  Class['Logwatch::Install'] -> Class['Logwatch::Config']
}
