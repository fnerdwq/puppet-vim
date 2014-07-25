require 'spec_helper'

describe 'vim' do

    let(:facts) { {:osfamily => 'Debian'} }

    it { should contain_class('vim::install') }
    it { should contain_class('vim::config') }


    context 'with extra_packages = somepackage' do
	let(:params) { { :extra_packages => 'somepackage' } }

	it { should contain_package('somepackage') }
    end


end


at_exit { RSpec::Puppet::Coverage.report! }

