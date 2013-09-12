# Printful

Ruby library for integrating with the Printful API

## Installation

Add this line to your application's Gemfile:

    gem 'printful', :github => 'elbongurk/printful'

And then execute:

    $ bundle

## Configuration

You can simply set the configuration

    Printful::Configuration.public_key ="YOURPUBLICKEY"
    Printful::Configuration.private_key = "YOURPRIVATEKEY"

## Examples

Fetch all products.

    response = Printful::Product.all
    if response.success?
      resonse.result.each do |product|
        puts product.id
      end
    else
      puts response
    end

Fetch an order

    response = Printful::Order.find(1)
    if response.success?
      puts response.result.notes
    else
      puts response
    end

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
