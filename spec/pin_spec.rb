require "spec_helper"

describe Pin do
  @os = RUBY_PLATFORM
  @on_pcduino =true
  before :all do
    @pin = Pin.new 1
  end

  if @os.include?("darwin")
    @on_pcduino = false
  end
  describe "#new" do

    it "should return a pin object" do
      @pin.should be_an_instance_of Pin
    end
    
    it "should raise an error for an incorrect pin number" do
      lambda { Pin.new(99) }.should raise_error
    end

    it "should not raise an error for an incorrect pin" do
	lambda { Pin.new(9) }.should_not raise_error
    end

    it "should have the correct mode URI" do
      @pin.mode_URI.should == "/sys/devices/virtual/misc/gpio/mode/gpio1" 
    end

    it "should have the correct status URI" do
      @pin.status_URI.should == "/sys/devices/virtual/misc/gpio/pin/gpio1"
    end
 
  end
  describe "#write_to_file" do
    it "should return true for a succesful file write" do
      test_file_name = "out.txt"
      out_file = File.new(test_file_name, "w")
      @pin.write_to_file(0,test_file_name).should be_true
      lambda{ @pin.write_to_file(0,test_file_name)} .should_not raise_error
      File.delete(test_file_name)
    end
  end

  describe "#set_as_input" do
    it "should return a pin object" do
      @pin.set_as_input.should be_an_instance_of Pin
    end

    it "should sucessfully write to its pin mode file" do
     lambda { @pin.set_as_input }.should_not raise_error
    end
  end

  describe "#set_as_input_pu" do
    it "should return a pin object" do
      @pin.set_as_input_pu.should be_an_instance_of Pin
    end

    it "should sucessfully write to its pin mode file" do
     lambda { @pin.set_as_input_pu }.should_not raise_error
    end
  end

  describe "#set_as_output" do
    it "should return a pin object" do
      @pin.set_as_input.should be_an_instance_of Pin
    end

    it "should sucessfully write to its pin mode file" do
     lambda { @pin.set_as_output }.should_not raise_error
    end
  end
  
  describe "#write" do 
    it "should not raise an error" do
      lambda { @pin.write(Logic::HIGH) }.should_not raise_error
    end

    it "should not allow invalid values" do 
      lambda { @pin.write(12) }.should raise_error
      lambda { @pin.write(-12) }.should raise_error
    end
  end

  describe "#read_from_file" do
    it "should raise error for a non exsistant file" do
      lambda { @pin.read_from_file("nonexisitantfile.txt") }.should raise_error
    end
  end

  describe "#read" do
    it "should return a value for sucessful read when set as input" do
      @pin.set_as_input
      @pin.read.should be_an(Integer)
    end

    it "should raise an error when set as output" do
      @pin.set_as_output
      lambda { @pin.read }.should raise_error
    end

  end
end
