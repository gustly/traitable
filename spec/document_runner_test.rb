require 'spec_helper'
require 'traitable'
require 'traitable/document_runner'

module Traitable
  describe DocumentRunner do

    describe ".execute" do

      before do
        TraitDefinitions.stub(:traits).and_return({ trait_name => trait_block })
      end

      context "method with a name but an empty block" do

        let(:trait_name) { :my_trait_1 }
        let(:trait_block) { -> { } }

        its(:to_doc) { should match /My Trait 1/ }
      end

      context "code block and a different trait name" do
        let(:trait_name) { :my_trait_2 }
        let(:trait_block) { -> { return true } }

        its(:to_doc) { should match /My Trait 2/ }
        its(:to_doc) { should match /return true/ }
      end
    end
  end
end


