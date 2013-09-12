module Printful
  class PrintfulError < ::StandardError; end
  class SSLCertificateError < PrintfulError; end
  class EmptyResponseError < PrintfulError; end
  class BadRequestError < PrintfulError; end
  class AuthenticationError < PrintfulError; end
  class AuthorizationError < PrintfulError; end  
  class NotFoundError < PrintfulError; end
  class ServerError < PrintfulError; end
  class UnexpectedError < PrintfulError; end

  class ValidationsFailed < PrintfulError
    attr_reader :error_result

    def initialize(error_result)
      @error_result = error_result
    end

    def inspect
      "#<#{self.class} error_result: #{@error_result.inspect}>"
    end

    def to_s
      inspect
    end
  end

end
