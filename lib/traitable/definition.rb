module Traitable
  module Definition
    def self.included(base)
      base.class_eval do
        def self.trait(name, &block)
          TraitDefinitions.define_trait(name, &block)
        end
      end
    end
  end
end
