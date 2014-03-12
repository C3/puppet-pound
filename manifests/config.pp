class pound::config {
  include concat::setup
  $pound_config = '/etc/pound/pound.cfg'

  File {
    require => Class['pound::install'],
    notify  => Class['pound::service'],
    owner   => 'root',
    group   => 'root',
    mode    => 644
  }

  concat { $pound_config:
    require => Class['pound::install'],
    notify  => Class['pound::service'],
    owner   => root,
    group   => root,
    mode    => '0644'
  }

  concat::fragment { 'pound_header':
    target  => $pound_config,
    content => template('pound/header.cfg.erb'),
    order   => 10,
  }

  concat::fragment { 'pound_http_start':
    target  => $pound_config,
    content => 'ListenHTTP',
    order   => 20,
  }

  # concat::fragment { 'pound_http_service_${name}': order => 30 }
  Concat::Fragment <<| tag == 'pound_http' |>>

  concat::fragment { 'pound_http_end':
    target  => $pound_config,
    content => 'End',
    order   => 40,
  }

  concat::fragment { 'pound_https_start':
    target  => $pound_config,
    content => 'ListenHTTPS',
    order   => 50,
  }

  # concat::fragment { 'pound_https_service_${name}': order => 60 }
  Concat::Fragment <<| tag == 'pound_https' |>>

  concat::fragment { 'pound_https_end':
    target  => $pound_config,
    content => 'End',
    order   => 70,
  }

  file { '/etc/default/pound':
    source => 'puppet:///modules/pound/default',
  }

}
