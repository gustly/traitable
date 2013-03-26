require 'haml'

module Traitable
  class DocumentRunner
    TEMPLATE = File.expand_path("../templates/trait_document.haml", __FILE__)

    def to_doc(options = {})
      engine = Haml::Engine.new(File.read(TEMPLATE))
      engine.render(self, traits: TraitDefinitions.traits)
    end
  end
end
