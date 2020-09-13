require 'spec_helper'

describe 'logwatch::install', type: :class do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }
      let(:pre_condition) { 'include logwatch' }

      it { is_expected.to contain_class('logwatch::install') }

      it do
        is_expected.to contain_package('logwatch').with(
          ensure: 'present',
          name:   'logwatch',
        )
      end
    end
  end
end
