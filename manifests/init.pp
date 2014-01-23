# simple class configuring vim defaults
class vim {
  package {'vim': ensure => present }


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

    file {'/etc/vim/vimrc.local':
      owner   => root,
      group   => root,
      mode    => '0644',
      source  => 'puppet:///vim/vimrc.local',
      require => Package['vim']
    }
  }

  file {'/etc/profile.d/vim.sh':
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///vim/vim.sh',
    require => Package['vim']
  }

}
