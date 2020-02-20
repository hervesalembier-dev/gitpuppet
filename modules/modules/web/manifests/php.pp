class web::php {

  include web

  package { 'libapache2-mod-php7.3':
    ensure => installed,
  }

}
