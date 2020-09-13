require 'spec_helper'

describe 'logwatch', type: :class do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to contain_class('logwatch::params') }
      it { is_expected.to contain_class('logwatch::install') }
      it { is_expected.to contain_class('logwatch::config') }
    end
  end
end
