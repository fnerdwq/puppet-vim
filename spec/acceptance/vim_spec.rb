require 'spec_helper_acceptance'

describe 'vim class', :unless => UNSUPPORTED_PLATFORMS.include?(fact('osfamily')) do

  case fact('osfamily')
  when 'Debian'
      package    = 'vim'
      configfile = '/etc/vim/vimrc'
  when 'RedHat'
      package    = 'vim-enhanced'
      configfile = '/etc/vimrc'
  end

  context 'default parameteres' do
    it 'should work with no errors' do
      pp = <<-EOS
      include 'vim'
      EOS

      apply_manifest(pp, :catch_failures => true)
      expect(apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
   end

     describe package(package) do
     it { should be_installed }
   end

   describe file(configfile) do
     it { should be_file }
   end

   describe file('/etc/profile.d/vim.sh') do
     it { should be_file }
   end

 end

end
