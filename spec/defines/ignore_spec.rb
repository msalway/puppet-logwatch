# frozen_string_literal: true

require 'spec_helper'

describe 'logwatch::ignore' do
  let(:title) { 'namevar' }
  let(:params) do
    { 'regex' => 'bob' }
  end

  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      it { is_expected.to compile }

      it do
        is_expected.to contain_concat__fragment(title).with(
          'target'  => 'ignore.conf',
          'content' => "bob\n",
          'order'   => '05',
        )
      end
    end
  end
end
