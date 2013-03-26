require 'spec_helper'
require 'traitable'

describe Traitable do
  let_double(:user)
  let_double(:traits)

  class TestClass
    include Traitable

    attr_accessor :user

    def initialize(user)
      @user = user
    end
  end

  subject { TestClass.new(user) }

  before do
    Traitable::Base.stub(:new).with(user).and_return(traits)
  end

  its(:traits) { should == traits }
end


