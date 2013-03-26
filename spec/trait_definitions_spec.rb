require 'spec_helper'
require 'traitable'

module Traitable
  describe TraitDefinitions do
    describe ".define_trait" do
      it "adds a boolean evaluation method by name" do
        TraitDefinitions.define_trait(:hello) {}
        TraitDefinitions.method_defined?(:hello?).should be_true
      end

      it "yields the block when the evaluation method is called" do
        test_class = Class.new
        test_class.send :include, TraitDefinitions

        TraitDefinitions.define_trait(:hello) do
          "block was called"
        end

        test_class.new.hello?.should == "block was called"
      end

      it "is added to traits" do
        block = -> { }
        TraitDefinitions.define_trait(:hello, &block)
        TraitDefinitions.traits.keys.last.should == :hello
        TraitDefinitions.traits.values.last.should == block 
      end
    end
  end
end

