class Bowling
  
  def initialize
    @score = 0
    @rolls = []
  end
  
  def roll (pins)
    @rolls << pins
  end
  
  def score
    while @rolls.length > 0
      roll_one = @rolls.slice!(0)
      roll_two = @rolls.slice!(0)
      if (roll_one + roll_two == 10) then
        @score += (10 + @rolls[0])
      else
        @score += (roll_one + roll_two)
      end
    end
    @score
  end
  
end
