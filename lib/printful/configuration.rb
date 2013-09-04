module Printful
  class Configuration
    API_VERSION = "1"
    
    class << self
      attr_writer :public_key, :private_key
    end
    attr_reader :public_key, :private_key

    def self.instantiate
      config = new(:public_key => @public_key, :private_key => @private_key)
    end

    def self.http
      Http.new(instantiate)
    end

    def initialize(attributes)
      attributes.each do |name, value|
        instance_variable_set "@#{name}", value
      end
    end

    def server
      "api.theprintful.com"
    end

    def base_path
      "/v#{api_version}"
    end

    def protocol
      ssl? ? "https" : "http"
    end

    def port
      ssl? ? 443 : 80
    end

    def api_version
      API_VERSION
    end

    def ca_file
      File.expand_path(File.join(File.dirname(__FILE__), "..", "ssl", "theprintful_com.pem"))
    end
    
    def ssl?
      true
    end

    def user_agent
      "Printful Ruby Gem v#{Printful::VERSION}"
    end
  end
end
