module Traitable
  class Base
    include TraitDefinitions

    attr_accessor :user

    def initialize(user)
      @user = user
    end
  end
end
