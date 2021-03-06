
class Pin

  attr_accessor :mode_URI,:status_URI,:pin,:input_value,:input_pu_value,:output_value,:mode
  def initialize(pin_num)
    @mode_URI = "/sys/devices/virtual/misc/gpio/mode/"
    @status_URI = "/sys/devices/virtual/misc/gpio/pin/"
    @pin = pin_num
    @mode_URI = @mode_URI << "gpio" << @pin.to_s
    @status_URI = @status_URI << "gpio" << @pin.to_s
    @input_value = 0
    @input_value_pu = 8
    @output_value = 1
    @state = 0;

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

  def set_as_output
    if write_to_file(@output_value,@mode_URI)
      @mode=@output_value
      self
    else
      raise "Error: couldnt write output_value to file"
    end
  end

  def set_as_input(file = @mode_URI)
    if write_to_file(@input_value,file)
      @mode=@input_value
      self
    else
      raise "Error: couldnt write input_value to file"
    end
  end

  def set_as_input_pu
    if write_to_file(@input_value_pu,@mode_URI)
      @mode=@input_pu_value
      self
    else
      raise "Error: couldnt write input_value to file"
    end
  end

  def write(value)
    if value.is_a? Integer and value == 0 or value == 1
      if @mode==@input_pu_value
        set_as_output
      end
      write_to_file(value.to_s,@status_URI)
    else
      raise "invalid value passed"
    end
  end

  def write_to_file (value,path)
    begin
      file = File.open(path, "w")
      file.write(value) 
    rescue IOError => e
      raise "error writing to file"
    ensure
      file.close unless file == nil
    end
    true
  end

  def read_from_file(file)
    begin
      file = File.open(file)
      line = file.gets
    rescue IOError => e
      raise "error reading from file: " + file
    ensure
      file.close unless file == nil
    end
    line.to_i

  end

  def read
      set_as_input
      read_from_file(@status_URI)
  end 

  def toggle
    if @state == 0
      @state = 1
    else
      @state = 0
    end
    write @state
    
  end
end

