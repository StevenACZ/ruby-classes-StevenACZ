require "minitest/autorun"
require_relative "dice"

class DiceTest < Minitest::Test
  def test_roll_respond_with_number_between_one_and_six
    # skip
    dice = Dice.new
    valid = proc { |n| n.between?(1, 6) }
    output, _error = capture_io do
      100.times { dice.roll }
    end
    assert(
      output.lines.map(&:to_i).all?(&valid),
      "After 100 tries, at least one roll wasn't between 1 and 6"
    )
  end

  def test_dice_initialize_with_zero_rolls
    skip
    dice = Dice.new

    output, _error = capture_io do
      dice.num_rolls
    end

    assert_equal  0,
                  output.lines.last.to_i,
                  "Should puts 0 if no roll have been call"
  end

  def test_respond_with_the_correct_number_of_rolls
    skip
    dice = Dice.new
    roll_amount = rand(10..100)

    output, _error = capture_io do
      roll_amount.times { dice.roll }
      dice.num_rolls
    end

    assert_equal  roll_amount,
                  output.lines.last.to_i,
                  "After #{roll_amount} rolls"
  end

  def test_reset_to_zero
    skip
    dice = Dice.new

    output, _error = capture_io do
      10.times { dice.roll }
      dice.reset
      dice.num_rolls
    end

    assert_equal  "0",
                  output.lines.last.chomp,
                  "After calling 'reset', num_rolls didn't return 0"
  end

  def test_num_rolls_cannot_be_set_externally
    skip
    dice = Dice.new
    assert_raises(NoMethodError) { dice.num_rolls = 10 }
  end
end
