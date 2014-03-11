class pound::service {

  service {'pound':
    ensure  => running,
    enable  => true,
    require => Class['pound::config']
  }

}
