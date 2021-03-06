require 'beaker-rspec'

UNSUPPORTED_PLATFORMS = []

unless ENV['RS_PROVISION'] == 'no' or ENV['BEAKER_provision'] == 'no'
  if hosts.first.is_pe?
    install_pe
  else
    install_puppet
  end
  hosts.each do |host|
    on hosts, "mkdir -p #{host['distmoduledir']}"
  end
end

RSpec.configure do |c|
  # Project root
  proj_root = File.expand_path(File.join(File.dirname(__FILE__), '..'))

  # Readable test descriptions
  c.formatter = :documentation
  c.before :suite do
    hosts.each do |host|
      copy_module_to(host, :source => proj_root, :module_name => 'bash')

      shell("/bin/touch #{default['puppetpath']}/hiera.yaml")
    end
  end
end
