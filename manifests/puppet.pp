class strongswan::puppet {

  File {
    ensure => directory,
  }

  file { ['/etc/strongswan/ipsec.d','/etc/strongswan/ipsec.d/certs','/etc/strongswan/ipsec.d/private','/etc/strongswan/ipsec.d/cacerts']:}

  file { '/etc/strongswan/ipsec.d/certs/peerCert.pem':
    ensure => file,
    source => "${::settings::ssldir}/certs/${::settings::clientcert}.pem",
  }
  file { '/etc/strongswan/ipsec.d/private/peerKey.pem':
    ensure => file,
    source => "${::settings::ssldir}/private_keys/${::settings::clientcert}.pem",
  }

  file { '/etc/strongswan/ipsec.d/cacerts/caCert.pem':
    ensure => file,
    source => "${::settings::ssldir}/certs/ca.pem",
  }
}
