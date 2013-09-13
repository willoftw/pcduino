require 'pcduino'

my_pin = Pin.new 13

while true
  my_pin.toggle
  sleep 1
end
