class muppet::peggy {

  # Create user peggy
  user { 'peggy':
    ensure => present,
    password => Sensitive("peggy"),
    shell => '/bin/bash',
    require => Group['peggy'],
    before => File['/home/peggy'],
  }

  # Create group
  group { 'peggy':
    ensure => present,
  }

  # Create home directory for user peggy
  file { '/home/peggy':
    ensure => 'directory',
    owner => 'peggy',
    group => 'peggy',
    before => File['/home/peggy/.profile']
  }

  # Create .profile
  file { '/home/peggy/.profile':
    ensure => present,
    content => "echo 'I was created by puppet!'",
    owner => 'peggy',
    group => 'peggy',
  }

  
}
