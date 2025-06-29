# 100-puppet_ssh_config.pp
# Puppet manifest to configure SSH client to use ~/.ssh/school and disable password authentication

file { '/home/ubuntu/.ssh':
  ensure => directory,
  owner  => 'ubuntu',
  group  => 'ubuntu',
  mode   => '0700',
}

file { '/home/ubuntu/.ssh/config':
  ensure  => present,
  owner   => 'ubuntu',
  group   => 'ubuntu',
  mode    => '0600',
}

file_line { 'Declare identity file':
  path  => '/home/ubuntu/.ssh/config',
  line  => '    IdentityFile ~/.ssh/school',
  match => '^\s*IdentityFile',
  require => File['/home/ubuntu/.ssh/config'],
}

file_line { 'Turn off passwd auth':
  path  => '/home/ubuntu/.ssh/config',
  line  => '    PasswordAuthentication no',
  match => '^\s*PasswordAuthentication',
  require => File['/home/ubuntu/.ssh/config'],
}

file_line { 'Set host block':
  path  => '/home/ubuntu/.ssh/config',
  line  => 'Host server01',
  match => '^Host ',
  require => File['/home/ubuntu/.ssh/config'],
}

file_line { 'Set hostname':
  path  => '/home/ubuntu/.ssh/config',
  line  => '    HostName 8.8.8.8',
  match => '^\s*HostName',
  require => File_line['Set host block'],
}

file_line { 'Set user':
  path  => '/home/ubuntu/.ssh/config',
  line  => '    User ubuntu',
  match => '^\s*User ',
  require => File_line['Set host block'],
}
