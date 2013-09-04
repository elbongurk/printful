module Printful
  class Response < Model
    attr_reader :code, :result

    def success?
      self.code == 200
    end
  end
end
