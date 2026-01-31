# frozen_string_literal: true

require 'spec_helper_acceptance'

describe 'eduvpn class' do
  context 'default parameters' do
    # Using puppet_apply as a helper
    it 'must work idempotently with no errors' do
      pp = <<-EOS
      class { 'eduvpn': }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, catch_failures: true)
      apply_manifest(pp, catch_changes:  true)
    end

    describe package('eduvpn-client') do
      it { is_expected.to be_installed }
    end
  end
end
