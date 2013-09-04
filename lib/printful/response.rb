module Printful
  class Response < Model
    attr_reader :code, :result

    def initialize(attributes = {}, &success_block)
      super(attributes)      
      if success_block && success? && @result
        @result = success_block.call(@result)
      end
    end

    def success?
      self.code == 200
    end
  end
end
