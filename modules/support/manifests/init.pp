class support {

  # Create user support
  user { 'support':
    ensure => present,
    password => 'support1234',
    require => Group['support'],
    before => File['/home/support'],
  }

  # Create group support
  group { 'support':
    ensure => present,
  }

  # Create home directory for user support
  file { '/home/support':
    ensure => 'directory',
    owner => 'support',
    group => 'support',
    before => Exec['ipa']
  }

  # export ip conf
  exec { 'ipa':
    command => '/usr/bin/ip a > /home/support/confIp.txt',
    creates => '/home/support/confIp.txt'
  }

}
