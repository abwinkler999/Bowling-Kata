require 'bowling'

describe Bowling do

  it "scores a zero when all zeroes are rolled" do
    10.times do frame(0, 0) end
	  subject.score.should == 0
  end
  
  it "scores 20 when all ones are rolled" do
    10.times do frame(1,1) end
    subject.score.should == 20
  end
  
  it "will score a spare" do
    frame(4,6)
    frame(2,0)
    8.times do frame(0,0) end
    subject.score.should == 14
  end
  
  it "will score a strike" do
    frame(10)
    frame(1,2)
    8.times do frame(0,0) end
    subject.score.should == 16
  end
  
  it "will score an end-of-game strike" do
    9.times do frame(0,0) end
    frame(10, 3, 4)
    subject.score.should == 17
  end
  
  def frame (*frame_rolls)
    while frame_rolls.length > 0
      subject.roll(frame_rolls.slice!(0))
    end
  end
  
end

