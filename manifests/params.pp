# simple class configuring vim defaults
class vim::params {

  $configuration = [
    'syntax on',
    'set background=dark',
    'highlight Comment term=bold ctermfg=lightblue guifg=lightblue',
    'set viminfo=\'10,\"100,:20,%,n~/.viminfo', # remember things over exit
    'set autoindent' ]
  $syntax_enable  = ['puppet']

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

