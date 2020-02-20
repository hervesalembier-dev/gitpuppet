class muppets::muppet(String $name) {

  # Create group
  group { $name:
    ensure => file,
    before => File["/home/${name}"],
  }

  # Create user
  user { $name:
    ensure => present,
    password => Sensitive("${name}"),
    shell => '/bin/bash',
    gid => $name,
    home => "home/${name}"
    require => Group[$name],
    before => File["/home/${name}"],
  }

  # Create home directory
  file { "/home/${name}":
    ensure => directory,
    owner => $name,
    group => $name,
  }

  # Create home directory
  file { "~/hello.txt":
    require => File["/home/${name}"],
    ensure => file,
    source => "puppet:///modules/muppets/${name}.txt"
    owner => $name,
    group => $name,
  }

  class { 'muppets::hello':
    name => $name }


}
