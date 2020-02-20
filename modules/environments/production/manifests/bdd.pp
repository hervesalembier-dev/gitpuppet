node 'agent-bdd' {
  notify {'bdd':
  }

  # remove mariadb
  package { 'mariadb-server':
    ensure => purged,
  }

  # install mysql
  package { 'default-mysql-server':
    ensure => installed,
  }

}

