require 'bowling'

describe Bowling do

  it "scores a zero when all zeroes are rolled" do
	  subject.score.should == 0
  end
  
  it "scores 20 when all ones are rolled" do
    20.times do subject.roll(1) end
    subject.score.should == 20
  end
  
  it "will score a spare" do
    subject.roll(4)
    subject.roll(6)
    subject.roll(2)
    17.times do subject.roll(1) end
    subject.score.should == 31
  end

end

