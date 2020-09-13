# @summary module to install and configure logwatch
#
# @param output
#   The output mode for logwatch
#
# @param format
#   The format of the report (text or html)
#
# @param mail_to
#   The list of users/email addresses to sent the report to
#
# @param mail_from
#   What to use in the mail from field
#
# @param range
#   The time range of logs to process
#
# @param detail
#   The level of detail for logwatch to use
#
# @param service
#   The list of services for logwatch to process
#
# @param package_ensure
#   The ensure parameter to pass to the package resource
#
# @param package_name
#   The name of the package to pass to the package resource
#
# @param ignore_conf
#   The path to ignore.conf
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
