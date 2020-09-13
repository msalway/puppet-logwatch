#
class logwatch::config (
  Enum['stdout','file','mail','unformatted'] $output    = $::logwatch::output,
  Enum['text','html']                        $format    = $::logwatch::format,
  Array[String[1]]                           $mail_to   = $::logwatch::mail_to,
  String[1]                                  $mail_from = $::logwatch::mail_from,
  Enum['All','Today','Yesterday']            $range     = $::logwatch::range,
  Enum['Low','Med','High']                   $detail    = $::logwatch::detail,
  Array[String[1]]                           $service   = $::logwatch::service,
) {

  file { 'logwatch.conf':
    ensure  => file,
    path    => '/etc/logwatch/conf/logwatch.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('logwatch/logwatch.conf.erb'),
  }

  concat { 'ignore.conf':
    path  => $logwatch::ignore_conf,
    owner => 'root',
    group => 'root',
    mode  => '0644',
  }

  concat::fragment { 'header':
    target  => 'ignore.conf',
    content => "###### REGULAR EXPRESSIONS IN THIS FILE WILL BE TRIMMED FROM REPORT OUTPUT #####\n",
    order   => '01',
  }
}
