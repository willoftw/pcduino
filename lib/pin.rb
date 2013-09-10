class Pin

  attr_accessor :mode_URI,:status_URI,:pin
  def initialize(pin_num)
    @mode_URI = "/sys/devices/virtual/misc/gpio/mode/"
    @status_URI = "/sys/devices/virtual/misc/gpio/pin/"
    @pin = pin_num
    @mode_URI = @mode_URI << "gpio" << @pin.to_s

    if @pin < 0 or @pin > 17
      raise "inaccessable pin specified"
    end
  end

  def check_connection(path)
    if File.exist?(path) 
      true
    else
      raise "Error file:" + path +  " doesnt exist"
    end
  end 
end

