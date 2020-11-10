class Dice
  @@num_rolls = 0

  def roll
    @@num_rolls += Random.rand(7)
  end
  def reset
    @@num_rolls = 0
  end
  def num_rolls
    @@num_rolls
  end
end
