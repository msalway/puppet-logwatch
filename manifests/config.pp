#
class logwatch::config (
) {

  file { 'logwatch.conf':
    ensure  => file,
    path    => '/etc/logwatch/conf/logwatch.conf',
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => epp('logwatch/logwatch.conf.epp',
      {
        'output'    => $::logwatch::output,
        'format'    => $::logwatch::format,
        'mail_to'   => $::logwatch::mail_to,
        'mail_from' => $::logwatch::mail_from,
        'range'     => $::logwatch::range,
        'detail'    => $::logwatch::detail,
        'service'   => $::logwatch::service,
      }
    ),
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
