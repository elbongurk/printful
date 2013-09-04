module Printful
  class Item < Model
    attr_reader :type, :brand, :model, :size, :color
    attr_accessor :product, :sku, :name, :imageUrl, :quantity
  end
end
