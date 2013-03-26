module Traitable
  class Base
    include TraitDefinitions

    attr_accessor :user

    def initialize(user)
      @user = user
    end

    def self.trait(name, &block)
      TraitDefinitions.define_trait(name, &block)
    end

  end
end
