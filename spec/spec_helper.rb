require "rspec"
require "pry"

require "traitable"

$:.unshift File.expand_path('..', __FILE__)
$:.unshift File.expand_path('../../lib', __FILE__)

Dir[File.expand_path('../support/**/*.rb', __FILE__)].each { |f| require f }

RSpec.configure do |config| 
  config.color_enabled = true
  config.before(:each) do
    @lib_dir = File.expand_path('../../lib', __FILE__)
  end
end
