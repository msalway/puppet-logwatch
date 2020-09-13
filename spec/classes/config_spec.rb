require 'spec_helper'

describe 'logwatch::config', type: :class do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include logwatch' }

      it { is_expected.to contain_class('logwatch::config') }

      it do
        is_expected.to contain_file('logwatch.conf').with(
          'ensure' => 'file',
          'path'   => '/etc/logwatch/conf/logwatch.conf',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        )
      end

      case os_facts[:osfamily]
      when 'RedHat'
        it { is_expected.to contain_file('logwatch.conf').with_content(%r{^Output = unformatted$}) }
      else
        it { is_expected.to contain_file('logwatch.conf').with_content(%r{^Output = stdout$}) }
      end
      it { is_expected.to contain_file('logwatch.conf').with_content(%r{^Format = text$}) }
      it { is_expected.to contain_file('logwatch.conf').with_content(%r{^MailTo = root$}) }
      it { is_expected.to contain_file('logwatch.conf').with_content(%r{^MailFrom = Logwatch$}) }
      it { is_expected.to contain_file('logwatch.conf').with_content(%r{^Range = Yesterday$}) }
      it { is_expected.to contain_file('logwatch.conf').with_content(%r{^Detail = Low$}) }
      it { is_expected.to contain_file('logwatch.conf').with_content(%r{^Service = All$}) }

      it do
        is_expected.to contain_concat('ignore.conf').with(
          'path'   => '/etc/logwatch/conf/ignore.conf',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        )
      end

      it do
        is_expected.to contain_concat__fragment('header').with(
          'target'  => 'ignore.conf',
          'content' => "###### REGULAR EXPRESSIONS IN THIS FILE WILL BE TRIMMED FROM REPORT OUTPUT #####\n",
          'order'   => '01',
        )
      end
    end
  end
end
