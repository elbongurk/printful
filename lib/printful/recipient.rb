module Printful
  class Recipient < Model
    attr_accessor :fullName, :company, :phone, :address1, :address2, :city, :state, :country, :zip
  end
end
