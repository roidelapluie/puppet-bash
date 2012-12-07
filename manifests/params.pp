class bash::params {

  case $::operatingsystem {
     /(?i:centos|redhat|scientific|oel|amazon|fedora)/: {
       $ps1_template = "${module_name}/centos/PS1.erb"
     }
     /(?i:debian|ubuntu)/: {
       $ps1_template = "${module_name}/debian/PS1.erb"
     }
     default: {
       fail "Operatingsystem $::operatingsystem is not supported."
     }
  }

}
