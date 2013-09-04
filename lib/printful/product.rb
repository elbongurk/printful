module Printful
  class Product < Model
    attr_reader :id, :type, :name, :model, :size, :price

    def self.all
      response = Configuration.http.get("/products")
      if response.success?
        response.result.map! do |attributes|
          Product.new(attributes)
        end
      end
      response
    end
  end
end
