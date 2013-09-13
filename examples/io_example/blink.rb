#!/usr/bin/env ruby

require 'pcduino'

blink_pin = Pin.new 13

while true
  blink_pin.toggle
  sleep 1
end
