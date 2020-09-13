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
  Enum['stdout','file','mail','unformatted'] $output,
  Enum['text','html']                        $format,
  Array[String[1]]                           $mail_to,
  String[1]                                  $mail_from,
  Enum['All','Today','Yesterday']            $range,
  Enum['Low','Med','High']                   $detail,
  Array[String[1]]                           $service,
  String[1]                                  $package_ensure,
  String[1]                                  $package_name,
  Stdlib::Unixpath                           $ignore_conf,
) {
  contain logwatch::install
  contain logwatch::config

  Class['Logwatch::Install'] -> Class['Logwatch::Config']
}
