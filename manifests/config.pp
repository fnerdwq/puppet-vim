# simple class configuring vim
class vim::config {

  # on Debian like globally enable extra syntax, if package installed
  # see parameter $extra_packages
  if $::osfamily == 'Debian' {
    vim::addon{ $vim::syntax_enable: }
  }

  $configuration = any2array($vim::configuration)
  file {'vimrc':
    path    => "${vim::params::configdir}/vimrc",
    owner   => root,
    group   => root,
    mode    => '0644',
    content => template("vim/vimrc.${::osfamily}.erb"),
  }

  file {'/etc/profile.d/vim.sh':
    owner   => root,
    group   => root,
    mode    => '0644',
    source  => 'puppet:///modules/vim/vim.sh',
  }

}
