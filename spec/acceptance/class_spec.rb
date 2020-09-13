require 'spec_helper_acceptance'

describe 'logwatch class' do
  context 'default parameters' do
    it 'applies with no errors' do
      pp = <<-EOS
      class { 'logwatch': }
      EOS
      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes: true)
    end

    describe package('logwatch') do
      it { is_expected.to be_installed }
    end

    describe file('/etc/logwatch/conf/logwatch.conf') do
      it { is_expected.to be_file }
      it { is_expected.to contain 'MailTo = root' }
    end
  end
end
