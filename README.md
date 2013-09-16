<<<<<<< HEAD
# Pcduino

A simple ruby gem to talk to the pins of a pcduino with very little code.

An example would be blink (can be found in examples), the code looks like this:

require 'pcduino'

blink_pin = Pin.new 13

while true do
  blink_pin.toggle
end 


Combining this gem with sinatra can make for very easy to undersand and simple home automation servers, an
example of this can be found in the examples folder!


Have fun!


## Installation

Add this line to your application's Gemfile:

    gem 'pcduino'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pcduino

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
=======
pcduino
=======

Ruby Gem to talk to pcduino's GPIO pins
>>>>>>> ee30f6e89a8310aae21264e176b2b6fa005164c6
