require 'serverspec'

# Required by serverspec
set :backend, :exec

## Use Junit formatter output, supported by jenkins but how to pass environment through kitchen?
## http://www.agilosoftware.com/blog/configuring-test-kitchen-output-jenkins/
## https://github.com/test-kitchen/busser-serverspec/issues/9
if ENV.has_key?('SERVERSPEC_JUNIT')
  require 'yarjuf'
  RSpec.configure do |c|
      c.formatter = 'JUnit'
  end
end
#require 'yarjuf'
#RSpec.configure do |c|
#  c.formatter = 'JUnit'
#end

describe package('virtualbox-6.0') do
  it { should be_installed }
end
