require "spec_helper"

describe Pin do

  before :each do
    @pin = Pin.new 1
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
 
  end

end
