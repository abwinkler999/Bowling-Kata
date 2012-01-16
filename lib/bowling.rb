class Bowling
  
  def initialize
    @score = 0
    @frames = 0
    @rolls = []
  end
  
  def roll (pins)
    @rolls << pins
  end
  
  def score
    while @rolls.length > 0
      @frames += 1
      roll_one = @rolls.slice!(0) # every frame has at least one roll
      if roll_one == 10 then # strike!
        if (@frames == 10) then # strike in last frame, score and delete bonus rolls
          @score += (roll_one + @rolls.slice!(0) + @rolls.slice!(0)) 
        else
          @score += (roll_one + @rolls[0] + @rolls[1])
          @frames += 1
          next # no more rolls in frame.  Advance to next execution.
        end
        next
      end
      roll_two = @rolls.slice!(0) # if not strike, then frame had second roll
      @score += (roll_one + roll_two)
      if (roll_one + roll_two == 10) then # spare!
        if (@frames == 10) then # spare in last frame, score and delete bonus roll
          @score += @rolls.slice!(0)
        else
          @score += @rolls[0]
        end
      end
    end
    @score
  end
end