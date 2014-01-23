# simple class configuring vim defaults
class vim {
  $package = $::osfamily ? {
    RedHat  => 'vim-enhanced',
    Debian  => 'vim',
    default => fail("Module ${module_name} is not supported on ${::operatingsystem}/${::osfamily}")
  }

  package { 'vim':
    ensure => present,
    name   => $package,
  }

  if $::osfamily == 'Debian' {
    # addon
    package {'vim-puppet': ensure => present, require => Package['vim'] }

    exec { 'puppet syntax':
      command     => 'vim-addon-manager -w install puppet',
      environment => ['HOME=/tmp'], # vim-addon-manager wants a set HOME dir (bug)
      unless      => 'vim-addon-manager -qw status puppet | grep -q installed',
      path        => ['/bin', '/usr/bin'],
      require     => Package['vim', 'vim-puppet']
    }
  }

  $additional_configuration=''

  $configdir = $::osfamily ? {
    RedHat  => '/etc',
    Debian  => '/etc/vim',
    default => fail("Module ${module_name} is not supported on ${::operatingsystem}/${::osfamily}")
  }

  file {'vimrc':
    name    => "${configdir}/vimrc",
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template("vim/vimrc.${::osfamily}.erb"),
    require => Package['vim']
  }

  file {'/etc/profile.d/vim.sh':
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/vim/vim.sh',
    require => Package['vim']
  }

}
