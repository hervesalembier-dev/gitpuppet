class web {
  include support

  package { 'nginx':
    ensure => purged
  }

  package { 'apache2':
    ensure => installed
  }

  file { '/var/www/html':
    ensure => directory,
  }


}
