require 'rubygems'
require 'spec'
require File.dirname(__FILE__) + '/../lib/swapper'

Spec::Runner.configure do |config|
  config.mock_with :rr
end
