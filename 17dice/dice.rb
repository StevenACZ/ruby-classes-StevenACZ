class Dice
  def roll
    @num_rolls = 0
    @num_rolls += 1
    Random.rand(7)
  end

  def reset
    @num_rolls = 0
  end

  attr_reader :num_rolls
end

dice = Dice.new
p dice.roll
p dice.roll
p dice.roll
p dice.num_rolls
dice.reset
p dice.num_rolls
