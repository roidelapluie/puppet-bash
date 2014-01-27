# == Class: bash
#
class bash (
  $show_fqdn    = $bash::params::show_fqdn,
  $ps1_template = $bash::params::ps1_template,
  $histformat   = $bash::params::histformat,
  $histsize     = $bash::params::histsize,
) inherits bash::params {

  file {
    '/etc/profile.d/PS1.sh':
      ensure  => present,
      content => template($ps1_template),
  }

  file{'/etc/profile.d/history.sh':
    ensure  => 'present',
    content => template('bash/history.erb'),
  }

}
