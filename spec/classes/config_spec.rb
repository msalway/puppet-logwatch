require 'spec_helper'

describe 'logwatch::config', type: :class do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

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
