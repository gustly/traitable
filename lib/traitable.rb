require "traitable/version"
require 'traitable/trait_definitions.rb'
require 'traitable/base.rb'

module Traitable
  def traits
    @traits ||= Base.new(user)
  end
end

