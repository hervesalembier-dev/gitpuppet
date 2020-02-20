class welcome_message {

  exec { 'welcome_message':
    command => "echo 'I was created by puppet! # >Puppet welcome message<' >> /etc/profile",
    path => '/usr/bin',
    onlyif => "grep '# >Puppet welcome message<' /etc/profile",
  }

}
