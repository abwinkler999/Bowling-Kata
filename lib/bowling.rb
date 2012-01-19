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
      if @frames == 10 then
        handle_last_frame
        next
      end
      
      roll_one = @rolls.slice!(0)
      
      if roll_one == 10 then
        handle_strike roll_one
        next
      end
      
      roll_two = @rolls.slice!(0)
      @score += (roll_one + roll_two)
      if (roll_one + roll_two == 10) then
        handle_spare
      end
    end
    @score
  end
  
  def handle_last_frame
    roll_one = @rolls.slice!(0)
    if roll_one == 10 then
        @score += (roll_one + @rolls.slice!(0) + @rolls.slice!(0)) 
        return
    end
    roll_two = @rolls.slice!(0)
    @score += (roll_one + roll_two)
    if (roll_one + roll_two == 10) then
      @score += @rolls.slice!(0)
    end
  end
  
  def handle_spare
    @score += @rolls[0]
  end
  def handle_strike roll_one
    @score += (roll_one + @rolls[0] + @rolls[1])
  end
end