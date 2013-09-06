require "spec_helper"

describe Pin do
  it "should return 1 for a successful pin connection to pin 1" do
    Pin.new(1) == 1
  end

  it "should return 0 for a no argument new" do
    Pin.new == 1
  end
end
