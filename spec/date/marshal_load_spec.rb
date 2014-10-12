require 'date'

describe "Date#marshal_load" do
  with_timezone("PST", +1) do
    before do
      @date = Date.new(2011, 7, 9)
      @dumped = [0, 2455752, 0, 0, 0, 2299161.0]
      @loaded = Date.new
      @loaded.marshal_load(@dumped)
    end

    it "hydrates" do
      @date.should == @loaded
    end

    it "dumps @ajd within some bounds" do
      @date.ajd.should be_close(@dumped[1], 1)
    end
  end
end
