module Printful
  class Order < Model
    attr_reader :shipping, :tax, :total, :created, :status, :fulfilments
    attr_accessor :number, :notes, :handling, :recipient, :items

    def self.find(order_number)
      raise ArgumentError if order_number.to_s.strip == ""
      Configuration.http.get("/orders/#{order_number}") do |result|
        Order.new(result)
      end
    end

    def self.find!(order_number)
      return_result_or_raise(:find, order_number)
    end

    def self.create(attributes = {})
      Configuration.http.post("/orders", attributes)
    end

    def self.create!(attributes = {})
      return_result_or_raise(:create, attributes)
    end

    # API doesn't seem to support this yet
    def self.update(order_number, attributes = {})
      raise ArgumentError if order_number.to_s.strip == ""
      Configuration.http.put("/orders/#{order_number}", attributes)
    end

    def self.update!(order_number, attributes = {})
      return_result_or_raise(:update, order_number, attributes)
    end

    # API doesn't seem to support this yet
    def self.delete(order_number)
      raise ArgumentError if order_number.to_s.strip == ""
      Configuration.http.delete("/orders/#{order_number}")
    end

    def self.delete!(order_number)
      return_result_or_raise(:delete, order_number)
    end

    def create
      Order.create(self)
    end

    def create!
      Order.create!(self)
    end

    def update
      Order.update(self.number, self)
    end

    def update!
      Order.update!(self.number, self)
    end

    def delete
      Order.delete(self.number)
    end

    def delete
      Order.delete!(self.number)
    end

    protected

    def set_instance_variables_from_hash(attributes)
      super(attributes)
      @items = (@items || []).map { |item| Item.new(item) }
      @fulfilments = (@fulfilments || []).map { |fulfilment| Fulfilment.new(fulfilment) }      
      # API seems to return :recipients hash yet create/update take :recipient hash
      recipient_hash = @recipients || @recipient
      @recipient = Recipient.new(recipient_hash) if recipient_hash
    end
  end
end
