module Chargify
  class Base < ActiveResource::Base
    self.format = :json
  end
end