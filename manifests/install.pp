# installs vim (private)
class vim::install {

  package { 'vim':
    ensure => present,
    name   => $vim::params::package,
  }

  $extra_packages = any2array($vim::extra_packages)
  package { $extra_packages:
    ensure => latest,
  }

}
