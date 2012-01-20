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
      roll_one = @rolls.slice!(0)
      if roll_one == 10 then
        handle_strike roll_one
        if @frames == 10 then break end
        next
      end
      roll_two = @rolls.slice!(0)
      @score += (roll_one + roll_two)
      if (roll_one + roll_two == 10) then
        handle_spare
        if @frames == 10 then break end
      end
    end
    @score
  end
  
  def handle_spare
    @score += @rolls[0]
  end
  
  def handle_strike roll_one
    @score += (roll_one + @rolls[0] + @rolls[1])
  end
end