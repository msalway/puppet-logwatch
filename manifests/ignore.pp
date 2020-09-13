# @summary add entries to ignore.conf
#
# @param regex
#   The regex to add
#
define logwatch::ignore (
  String[1] $regex,
) {
  concat::fragment { $title:
    target  => 'ignore.conf',
    content => "${regex}\n",
    order   => '05',
  }
}
