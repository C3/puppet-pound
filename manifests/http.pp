class pound::http (
    $head_require="Host: ${hostname}",
    $backend_ip=$::ipaddress,
    $backend_port='80') {

    @@concat::fragment { "pound_http_service_${hostname}_${head_require}":
      target  => '/etc/pound/pound.cfg',
      content => template('pound/http.cfg.erb'),
      order   => '30',
      tag     => 'pound_http',
    }

}
