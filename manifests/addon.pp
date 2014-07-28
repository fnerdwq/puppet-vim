# globally enables vim syntax on Debian like systems (private)
define vim::addon {

  if $::osfamily == Debian {
    exec { "enable vim syntax: ${title}":
      command     => "vim-addons -w install ${title}",
      environment => ['HOME=/tmp'], # vim-addon-manager wants a set HOME dir (bug)
      unless      => "vim-addons -qw status ${title} | grep -q installed",
      path        => ['/bin', '/usr/bin'],
    }
  } else {
    fail("'vim:addon not supported on ${::osfamily}")
  }

}
