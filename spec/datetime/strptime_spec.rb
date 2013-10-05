require 'date'

describe "DateTime#strptime" do

  it "uses the default format" do
    DateTime.strptime("2000-04-06T01:01:01+01:00").should == DateTime.civil(2000, 4, 6, 1, 1, 1, '+1')
  end

end
