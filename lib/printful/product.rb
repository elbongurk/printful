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
  end
end
