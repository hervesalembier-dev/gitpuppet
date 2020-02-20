class muppets::hello(String $name) {

  # Create home directory for user kermit
  file { '/etc/profile.d/muppethello.sh':
    require => File["/home/${name}"],
    ensure => 'file',
    content => epp('hello.epp', {
      name => $name
    })
  }

}
