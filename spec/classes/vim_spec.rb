require 'spec_helper'

describe 'vim' do

  let :facts do
    {
      :osfamily        => 'Debian',
      :operatingsystem => 'Ubuntu',
    }
  end

  it { should contain_class('vim::params') }
  it { should contain_class('vim::install') }
  it { should contain_class('vim::config') }

  it { should create_file('/etc/profile.d/vim.sh') }

  context 'on Debian OS' do
    it { should contain_package('vim').with_name('vim') }
    it { should contain_package('vim-puppet') }

    it { should contain_vim__addon('puppet') }

    it { should contain_file('vimrc').with(
        'path'    => '/etc/vim/vimrc',
        'content' => /^syntax on$/
      )
    }
  end

  context 'on RedHat OS' do
    let :facts do
      {
        :osfamily        => 'RedHat',
        :operatingsystem => 'CentOS',
      }
    end

    it { should contain_package('vim').with_name('vim-enhanced') }
    it { should_not contain_vim__addon('puppet') }
    it { should contain_file('vimrc').with(
        'path'    => '/etc/vimrc',
        'content' => /^syntax on$/
      )
    }
  end

  context 'on unsupported OS' do
    let :facts do
      {
        :osfamily => 'Suse',
        :operatingsystem => 'OpenSuSE'
      }
    end

    it {
      expect {
        should raise_error(Puppet::Error, /Module vim is not supported on OpenSuSE\/Suse/)
      }
    }
  end

  context 'with different parameters' do

    context 'with extra_packages = somepackage' do
      let(:params) { { :extra_packages => 'somepackage' } }

      it { should contain_package('somepackage') }
    end

    context 'with configuration = [\'some funny parameter\']' do
      let(:params) { { :configuration => ['some funny parameter'] } }

      it { should contain_file('vimrc').with_content(/^some funny parameter$/) }
    end

    context 'with syntax_enable = []' do
      let(:params) { { :syntax_enable => [] } }

      it { should_not contain_vim__addon('puppet') }
    end
  end


end
