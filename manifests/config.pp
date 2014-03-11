class pound::config {

    File {
      require => Class['pound::install'],
      notify  => Class['pound::service'],
      owner   => 'root',
      group   => 'root',
      mode    => 644
    }

    file { '/etc/pound/pound.conf':
      source => 'puppet:///modules/pound/pound.cfg'
    }

    file { '/etc/default/pound':
      source => 'puppet:///modules/pound/default',
    }

}
