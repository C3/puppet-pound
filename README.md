Puppet module to installing and configure [pound](http://www.apsis.ch/pound), the reverse-proxy and load-balancer.

## Assumptions

1. concat is available
1. stdlib is available (dep. for concat)
1. puppetdb is available (dep. for exported resources)

## Usage

### Pound

Nominate a node to receive pound:

```
node chosen {
  include pound
}
```

This will install pound, set /etc/default/pound to allow startup, and trigger the service.

### HTTP

```
node refinery {
  class { 'pound::http':
    # defaults to "Host: $::hostname"
    head_require    => 'Host: catswithhats.jpg.to',
    # defaults to $::ipaddress
    backend_ip       => '255.255.255.255',
    # defaults to 80
    backend_port    => '81'
  }
}
```

### HTTPS

```
node refinery {
  class { 'pound::https':
    # no default
    certificate          => '/full/path/to/where/certificate/is.pem',
    # defaults to "Host: $::hostname"
    head_require    => 'Host: superspecialawesome.com',
    # defaults to $::ipaddress
    backend_ip       => '127.0.0.1',
    # defaults to 80
    backend_port    => '8080'
  }
}
```

## Configuration

None.

## Notes

1. Will bind to all interfaces (0.0.0.0)
1. Certificates for HTTPS proxying need to exist on the pound host, make sure they end up there with a ```file {}``` or something similar
1. Only tested on Ubuntu 12.04

## TODO

1. Fix SSL config so it conditionally adds itself, you can't have an empty ```ListenHTTPS``` block or it barfs on startup
1. Configure SSL certs in a betterer manner
1. Add options to configure header flags, add others

## Contributing

1. Fork it ( https://github.com/tism/puppet-pound/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
