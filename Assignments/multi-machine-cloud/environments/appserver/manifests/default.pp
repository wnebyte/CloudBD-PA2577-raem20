exec { 'apt-update':				   
  command => '/usr/bin/apt-get update' 
}

exec {'node-update': 
  command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -',
  require => Exec['apt-update']
}

package { 'nodejs':
  require => Exec['node-update'],
  ensure => installed,
}