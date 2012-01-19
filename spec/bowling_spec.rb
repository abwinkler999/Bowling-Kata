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
  
  it "will score a mixed game" do
    frame(4,6)
    frame(10)
    frame(1,1)
    frame(2,8)
    frame(2,8)
    frame(1,0)
    4.times do frame(0,0) end
    subject.score.should == 58
  end
    
  it "will score an end-of-game strike" do
    9.times do frame(0,0) end # nine gutterball frames
    frame(10, 3, 4) # strike on last frame
    subject.score.should == 17
  end
  
  it "will score an end-of-game spare" do
    9.times do frame(0,0) end # nine gutterball frames
    frame(4,6,2) # spare on last frame
    subject.score.should == 12
    end
  
  def frame (*frame_rolls)
    while frame_rolls.length > 0
      subject.roll(frame_rolls.slice!(0))
    end
  end
  
end

