node 'agent-back' {
  notify {'back':
  }

  include support

  # install nginx
  package { 'default-jdk':
    ensure => installed,
  }

}

