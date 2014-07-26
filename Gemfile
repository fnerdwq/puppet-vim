source 'https://rubygems.org'

puppetversion = ENV.key?('PUPPET_VERSION') ? "= #{ENV['PUPPET_VERSION']}" : ['>= 3.2']

gem 'puppet-lint'
gem 'rspec', '<3.0.0' # https://github.com/rodjek/rspec-puppet/issues/198
gem 'rspec-puppet', :git => 'https://github.com/rodjek/rspec-puppet'
gem 'puppetlabs_spec_helper'
gem 'puppet', puppetversion

