# Private class
#
class logwatch::params {

  $output         = $::osfamily ? {
    'RedHat' => 'unformatted',
    default  => 'stdout',
  }
  $format         = 'text'
  $mail_to        = [ 'root' ]
  $mail_from      = 'Logwatch'
  $range          = 'Yesterday'
  $detail         = 'Low'
  $service        = [ 'All' ]
  $package_ensure = 'present'
  $package_name   = 'logwatch'
  $ignore_conf    = '/etc/logwatch/conf/ignore.conf'

}
