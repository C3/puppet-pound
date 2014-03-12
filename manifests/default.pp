node 'pound.example.com' {
  include pound
}

node 'apache.example.com' {
  class { 'pound::http':
    head_require  => 'apache',
    backend_ip    => '192.168.0.1',
    backend_port  => '80',
  }
}
