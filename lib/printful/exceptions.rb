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
end
