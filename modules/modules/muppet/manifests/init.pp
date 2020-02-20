class muppet {

  # Create user kermit
  user { 'kermit':
    ensure => present,
    password => Sensitive("kermit"),
    shell => '/bin/bash',
    require => Group['kermit'],
    before => File['/home/kermit'],
  }

  # Create group
  group { 'kermit':
    ensure => present,
  }

  # Create home directory for user kermit
  file { '/home/kermit':
    ensure => 'directory',
    owner => 'kermit',
    group => 'kermit',
    before => File['/home/kermit/.profile']
  }

  # Create .profile
  file { '/home/kermit/.profile':
    ensure => present,
    content => "echo 'I was created by puppet!'",
    owner => 'kermit',
    group => 'kermit',
  }

  
}
