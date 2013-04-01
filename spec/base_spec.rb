require 'spec_helper'

module Traitable
  describe Base do
    let_double(:user)

    describe "#user" do
      subject { Base.new(user) }
      its(:user) { should == user }
    end

    describe ".trait" do
      it "defines the trait in the trait definitions" do
        trait_name = 'trait_name'
        trait_block = -> { :some_block }

        TraitDefinitions.should_receive(:define_trait) do |passed_in_name, &passed_in_block|
          passed_in_name.should == trait_name
          passed_in_block.should == trait_block
        end

        Module.new do
          include Traitable::Definition

          trait trait_name, &trait_block
        end
      end
    end
  end
end

