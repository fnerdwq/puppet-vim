# == Class: vim
#
# This class installs and configures vimc.
#
# This works on Debian and RedHat like systems.
# Puppet Version >= 3.4.0
#
# === Parameters
#
# [*configuration*]
#   An array containing configurations lines to be appended to the global
#   vimrc.
#   *Optional* (defaults to some usefull settings)
#
# [*extra_packages*]
#   Array of extra packages to install for vim, in particular userfull for
#   syntax packages in Debian like systems.
#   *Optional* (defaults to vim-puppet for Debian, empty for RedHat)
#
# [*syntax_enable*]
#   Syntax name to globally enable through vim-addon-manager, only on Debian
#   like systems!
#   *Optional* (defaults to puppet)
#
# === Examples
#
# include vim
#
# === Authors
#
# Frederik Wagner <wagner@wagit.de>
#
# === Copyright
#
# Copyright 2014 Frederik Wagner
#
class vim (
  $configuration = [
    'syntax on',
    'set background=dark',
    'highlight Comment term=bold ctermfg=lightblue guifg=lightblue',
    'set viminfo=\'10,\"100,:20,%,n~/.viminfo', # remeber things over exit
    'set autoindent' ],
  $extra_packages = $vim::params::extra_packages,
  $syntax_enable  = ['puppet']
) inherits vim::params {

  class {'vim::install': }
  -> class {'vim::config': }

}
