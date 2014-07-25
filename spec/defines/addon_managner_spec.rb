require 'spec_helper'

describe 'vim::addon_manager' do
    let(:title) { 'puppet' }

    context "on Debian like systems" do
	  let(:facts) { {:osfamily => 'Debian'} }
      it { should contain_exec('enable vim syntax: puppet') }
    end

    context "on other systems" do
	  let(:facts) { {:osfamily => 'RedHat'} }
      it do
        expect { should raise_error(Puppet::Error, /not supported/) }
      end
    end

end


#at_exit { RSpec::Puppet::Coverage.report! }

