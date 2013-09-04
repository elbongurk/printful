module Printful
  module Util
    def self.raise_exception_for_status_code(status_code)
      case status_code.to_i
      when 400
        raise BadRequestError
      when 401
        raise AuthenticationError
      when 403
        raise AuthorizationError
      when 404
        raise NotFoundError
      when 500
        raise ServerError
      else
        raise UnexpectedError, "Unexpected HTTP_RESPONSE #{status_code.to_i}"
      end
    end
  end
end
