require "traitable/version"
require 'traitable/trait_definitions'
require 'traitable/definition'
require 'traitable/base'

module Traitable
  def traits
    @traits ||= Base.new(user)
  end
end

