# globally enables vim syntax on Debian like systems (private)
define vim::addon_manager {

  if $::osfamily == Debian {
    exec { "enable vim syntax: ${title}":
      command     => "vim-addon-manager -w install ${title}",
      environment => ['HOME=/tmp'], # vim-addon-manager wants a set HOME dir (bug)
      unless      => "vim-addon-manager -qw status ${title} | grep -q installed",
      path        => ['/bin', '/usr/bin'],
    }
  } else {
    fail("'vim:addon_manager not supported on ${::osfamily}")
  }

}
