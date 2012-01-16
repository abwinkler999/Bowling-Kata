class Bowling
  
  def initialize
    @score = 0
    @rolls = []
    @frames = []
  end
  
  def roll (pins)
    @rolls << pins
  end
  
  def score
          
    while @rolls.length > 0
      roll_one = @rolls.slice!(0)
      if roll_one == 10 then
        @score += (roll_one + @rolls[0] + @rolls[1])
        next
      end
      roll_two = @rolls.slice!(0)
      @score += (roll_one + roll_two)
      if (roll_one + roll_two == 10) then
        @score += @rolls[0]
      end
    end
    @score
  end
  
end
