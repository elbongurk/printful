module Printful
  class Http
    def initialize(config)
      @config = config
    end

    def post(path, body = nil)
     process http_do(Net::HTTP::Post, path, body)
    end

    def put(path, body = nil)
      process http_do(Net::HTTP::Put, path, body)
    end

    def delete(path)
      process http_do(Net::HTTP::Delete, path)
    end

    def get(path, &success_block)
      response = http_do(Net::HTTP::Get, path)
      process(response, &success_block)
    end

    private

    def process(response, &success_block)
      if response.code == "200"
        if response.body.empty?
          raise Printful::EmptyResponseError
        else
          Response.new(JSON.parse(response.body), &success_block)
        end
      else
        Util.raise_exception_for_status_code(response.code)
      end
    end
   
    def http_do(verb, path, body = nil)
      connection = Net::HTTP.new(@config.server, @config.port)
      connection.read_timeout = 60

      if @config.ssl?
        connection.use_ssl = true
        connection.verify_mode = OpenSSL::SSL::VERIFY_PEER
        connection.ca_file = @config.ca_file
      end

      connection.start do |http|
        request = verb.new("#{@config.base_path}#{path}")
        request["User-Agent"] = @config.user_agent
        request.basic_auth @config.public_key, @config.private_key
        
        request["Content-Type"] = "application/json"
        request.body = body.to_json

        response = http.request(request)
      end
    rescue OpenSSL::SSL::SSLError
      raise Printful::SSLCertificateError
    end
  end
end
