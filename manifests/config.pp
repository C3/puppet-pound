class pound::config (
  $allow_all_methods  = $pound::allow_all_methods,
  $pound_config       = '/etc/pound/pound.cfg'
){
  include concat::setup

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
    order   => '10',
  }

  concat::fragment { 'pound_http_start':
    target  => $pound_config,
    content => "ListenHTTP\n    Address 0.0.0.0\n    Port 80\n",
    order   => '20',
  }

  if $allow_all_methods {
    concat::fragment { 'pound_http_methods':
      target  => $pound_config,
      content => "    xHTTP 1\n",
      order   => '25',
    }
  }

  # order 30
  Concat::Fragment <<| tag == 'pound_http' |>>

  concat::fragment { 'pound_http_end':
    target  => $pound_config,
    content => "End\n",
    order   => '40',
  }

  #concat::fragment { 'pound_https_start':
  #  target  => $pound_config,
  #  content => "ListenHTTPS\n    Address 0.0.0.0\n    Port 443\n",
  #  order   => '50',
  #}

  ## order 60
  #Concat::Fragment <<| tag == 'pound_https' |>>

  #concat::fragment { 'pound_https_end':
  #  target  => $pound_config,
  #  content => "End\n",
  #  order   => '70',
  #}

  file { '/etc/default/pound':
    source => 'puppet:///modules/pound/default',
  }

}
