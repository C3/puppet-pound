class pound::https (
    $certificate,
    $head_require=$::hostname,
    $backend_ip=$::ipaddress,
    $backend_port='80') {

    @@concat::fragment { "pound_https_service_${hostname}_${head_require}":
      target  => '/etc/pound/pound.cfg',
      content => template('pound/https.cfg.erb'),
      order   => 60,
      tag     => 'pound_https',
    }

}
