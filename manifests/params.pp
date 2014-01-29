# simple class configuring vim defaults
class vim::params {

  case  $::osfamily {
    Debian: {
      $package = 'vim'
      $extra_packages = ['vim-puppet']
      $configdir = '/etc/vim'
    }
    RedHat:  {
      $package = 'vim-enhanced'
      $extra_packages = []
      $configdir = '/etc'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::operatingsystem}/${::osfamily}")
    }
  }

}

