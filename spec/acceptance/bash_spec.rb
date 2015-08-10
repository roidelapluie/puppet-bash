require 'spec_helper_acceptance'

describe 'bash class' do
  describe 'running puppet code' do
    it 'should work with no errors' do
      pp = <<-EOS
         class { 'bash': show_fqdn => true }
      EOS

      # Run it twice and test for idempotency
      apply_manifest(pp, :catch_failures => true)
      expect(apply_manifest(pp, :catch_failures => true).exit_code).to be_zero
    end
  end
end
