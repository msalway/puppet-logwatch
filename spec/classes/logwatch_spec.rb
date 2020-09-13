require 'spec_helper'

describe 'logwatch', type: :class do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to contain_class('logwatch::params') }
      it { is_expected.to contain_class('logwatch::install') }
      it { is_expected.to contain_class('logwatch::config') }

      it do
        is_expected.to contain_package('logwatch').with(
          ensure: 'present',
          name:   'logwatch',
        )
      end

      it do
        is_expected.to contain_file('logwatch.conf').with(
          'ensure' => 'file',
          'path'   => '/etc/logwatch/conf/logwatch.conf',
          'owner'  => 'root',
          'group'  => 'root',
          'mode'   => '0644',
        )
      end
    end
  end
end
