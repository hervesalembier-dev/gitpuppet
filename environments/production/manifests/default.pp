node default {
  notify {'Hello from Puppet Server!':
  }

  # Create user support
  user { 'support':
    ensure => present,
    password => Sensitive("support1234​"),
    require => Group['support'],
    before => File['/home/support'],
  }

  # Create group support
  group { 'support':
    ensure => present,
  }

  # Create home directory for user support
  file { '/home/support':
    ensure => 'support',
    owner => 'support',
    group => 'support',
    before => Exec['ipa']
  }

  # ssh keygen
  exec { 'ipa':
    command => '/usr/bin/ip a > /home/support/confIp.txt',
    creates => '/home/support/confIp.txt'
  }

}

