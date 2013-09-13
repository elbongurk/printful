module Printful
  class Product < Model
    attr_reader :id, :type, :name, :model, :size, :price

    def self.all
      Configuration.http.get("/products") do |result|
        result.map do |hash|
          Product.new(hash)
        end
      end
    end

    def self.all!
      return_result_or_raise(:all)
    end
  end
end
