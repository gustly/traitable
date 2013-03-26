require 'spec_helper'

module Traitable
  describe Base do
    let_double(:user)

    describe "#user" do
      subject { Base.new(user) }
      its(:user) { should == user }
    end

    describe ".trait" do
      let_double(:name)
      let(:block) { -> {} }

      it "defines the trait in the trait definitions" do
        TraitDefinitions.stub(:define_trait) do |passed_in_name, &passed_in_block|
          passed_in_name.should == name
          passed_in_block.should == block
        end

        Base.trait(name, &block)
      end
    end
  end
end

