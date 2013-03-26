module Traitable
  module TraitDefinitions

    def self.define_trait(name, &block)
      define_method(:"#{name.to_sym}?", &block)
      traits[name.to_sym] = block
    end

    def self.traits
      @traits ||= {}
    end

  end
end
