exec { 'apt-update':                   
  command => '/usr/bin/apt-get update' 
}
  
package { 'mysql-server':
  require => Exec['apt-update'],     
  ensure => installed,
}
  
service { 'mysql':
  ensure => running,
}