require "minitest/autorun"
require_relative "coffee"

class CoffeeMachineTest < Minitest::Test
  def test_coffee_machine_store_correctly_initial_capacities
    # skip
    coffee = 8
    water = 10
    milk = 4
    coffee_machine = CoffeeMachine.new(coffee, water, milk)

    assert_equal coffee, coffee_machine.coffee_cap, "Coffe capacity not match initialization"
    assert_equal water, coffee_machine.water_cap, "Water capacity not match initialization"
    assert_equal milk, coffee_machine.milk_cap, "Milk capacity not match initialization"
  end

  def test_coffee_machine_starts_empty
    skip
    coffee = 8
    water = 10
    milk = 4
    coffee_machine = CoffeeMachine.new(coffee, water, milk)

    assert_equal 0, coffee_machine.coffee, "Coffe should start empty (0)"
    assert_equal 0, coffee_machine.water, "Water should start empty (0)"
    assert_equal 0, coffee_machine.milk, "Milk should start empty (0)"
  end

  def test_fill_coffee_to_coffee_machine
    skip
    coffee = 8
    water = 10
    milk = 4
    coffee_machine = CoffeeMachine.new(coffee, water, milk)
    output, _error = capture_io do
      coffee_machine.fill_coffee(3)
    end
    expected = "Coffee new level 3/#{coffee}"
    assert_equal  expected,
                  output.lines.last.chomp,
                  "When filled with 3 units and capacity is #{coffee}"
    assert_equal 3, coffee_machine.coffee, "When filled with 3 units and capacity is #{coffee}"

    output, _error = capture_io do
      coffee_machine.fill_coffee(3)
    end
    expected = "Coffee new level 6/#{coffee}"
    assert_equal  expected,
                  output.lines.last.chomp,
                  "When filled twice with 3 units and capacity is #{coffee}"
    assert_equal 6, coffee_machine.coffee, "When filled with 3 units twice and capacity is #{coffee}"

    output, _error = capture_io do
      coffee_machine.fill_coffee(3)
    end
    expected = "Too much! Only 2 free"
    assert_equal  expected,
                  output.lines.last.chomp,
                  "When try to fill it thrice with 3 units and capacity is #{coffee}"
    assert_equal 6, coffee_machine.coffee, "When try to fill it thrice with 3 units and capacity is #{coffee}"
  end

  def test_fill_water_to_coffee_machine
    skip
    coffee = 8
    water = 10
    milk = 4
    coffee_machine = CoffeeMachine.new(coffee, water, milk)
    output, _error = capture_io do
      coffee_machine.fill_water(8)
    end
    expected = "Water new level 8/#{water}"
    assert_equal  expected,
                  output.lines.last.chomp,
                  "When filled with 8 units and capacity is #{water}"
    assert_equal 8, coffee_machine.water, "When filled with 8 units and capacity is #{water}"

    output, _error = capture_io do
      coffee_machine.fill_water(8)
    end
    expected = "Too much! Only 2 free"
    assert_equal  expected,
                  output.lines.last.chomp,
                  "When try to fill with 8 units twice and capacity is #{water}"
    assert_equal 8, coffee_machine.water, "When try to fill with 8 units twice and capacity is #{water}"
  end

  def test_fill_milk_to_coffee_machine
    skip
    coffee = 8
    water = 10
    milk = 4
    coffee_machine = CoffeeMachine.new(coffee, water, milk)
    output, _error = capture_io do
      coffee_machine.fill_milk(3)
    end
    expected = "Milk new level 3/#{milk}"
    assert_equal  expected,
                  output.lines.last.chomp,
                  "When filled with 3 units and capacity is #{milk}"
    assert_equal 3, coffee_machine.milk, "When filled with 3 units and capacity is #{milk}"

    output, _error = capture_io do
      coffee_machine.fill_milk(3)
    end
    expected = "Too much! Only 1 free"
    assert_equal  expected,
                  output.lines.last.chomp,
                  "When try to fill with 3 units twice and capacity is #{milk}"
    assert_equal 3, coffee_machine.milk, "When try to fill with 3 units twice and capacity is #{milk}"
  end

  def test_make_coffee_when_enough_ingredients
    skip
    coffee = 8
    water = 10
    milk = 4
    coffee_machine = CoffeeMachine.new(coffee, water, milk)
    _output, _error = capture_io do
      coffee_machine.fill_coffee(8)
      coffee_machine.fill_water(10)
      coffee_machine.fill_milk(4)
    end

    cup1_ingredients = { coffee: 2, water: 2, milk: 1 }
    output, _error = capture_io do
      coffee_machine.make_coffee(cup1_ingredients)
    end
    expected = "Your coffee is ready!"
    error_message = "When enough ingredients"
    assert_equal  expected, output.lines.last.chomp, error_message

    cup2_ingredients = { coffee: 3, water: 1, milk: 2 }
    output, _error = capture_io do
      coffee_machine.make_coffee(cup2_ingredients)
    end
    expected = "Your coffee is ready!"
    error_message = "When enough ingredients"
    assert_equal  expected, output.lines.last.chomp, error_message

    cup3_ingredients = { coffee: 1, water: 1, milk: 1 }
    output, _error = capture_io do
      coffee_machine.make_coffee(cup3_ingredients)
    end
    expected = "Your coffee is ready!"
    error_message = "When enough ingredients"
    assert_equal  expected, output.lines.last.chomp, error_message
  end

  def test_make_coffee_when_not_enough_ingredients
    skip
    coffee = 8
    water = 10
    milk = 4
    coffee_machine = CoffeeMachine.new(coffee, water, milk)
    _output, _error = capture_io do
      coffee_machine.fill_coffee(1)
      coffee_machine.fill_water(1)
      coffee_machine.fill_milk(1)
    end

    cup1_ingredients = { coffee: 2, water: 1, milk: 1 }
    output, _error = capture_io do
      coffee_machine.make_coffee(cup1_ingredients)
    end
    expected = "Not enough coffee"
    error_message = "When coffee is not enough"
    assert_equal  expected, output.lines.last.chomp, error_message

    cup2_ingredients = { coffee: 1, water: 2, milk: 1 }
    output, _error = capture_io do
      coffee_machine.make_coffee(cup2_ingredients)
    end
    expected = "Not enough water"
    error_message = "When water is not enough"
    assert_equal  expected, output.lines.last.chomp, error_message

    cup3_ingredients = { coffee: 1, water: 1, milk: 2 }
    output, _error = capture_io do
      coffee_machine.make_coffee(cup3_ingredients)
    end
    expected = "Not enough milk"
    error_message = "When milk is not enough"
    assert_equal  expected, output.lines.last.chomp, error_message

    cup4_ingredients = { coffee: 2, water: 2, milk: 2 }
    output, _error = capture_io do
      coffee_machine.make_coffee(cup4_ingredients)
    end
    expected = ["Not enough coffee", "Not enough water", "Not enough milk"].join("\n")
    error_message = "When neither of the ingredients are enough"
    assert_equal expected, output.chomp, error_message
  end

  def test_make_coffee_when_you_get_short_of_ingredients
    skip
    coffee = 8
    water = 10
    milk = 4
    coffee_machine = CoffeeMachine.new(coffee, water, milk)
    _output, _error = capture_io do
      coffee_machine.fill_coffee(3)
      coffee_machine.fill_water(3)
      coffee_machine.fill_milk(3)
    end

    cup_ingredients = { coffee: 2, water: 2, milk: 2 }
    output, _error = capture_io do
      coffee_machine.make_coffee(cup_ingredients)
    end
    expected = "Your coffee is ready!"
    assert_equal expected, output.lines.last.chomp
    output, _error = capture_io do
      coffee_machine.make_coffee(cup_ingredients)
    end
    expected = ["Not enough coffee", "Not enough water", "Not enough milk"].join("\n")
    error_message = "When neither of the ingredients are enough"
    assert_equal expected, output.chomp, error_message
  end

  def test_make_coffee_when_nor_water_or_milk_are_given
    skip
    coffee = 8
    water = 10
    milk = 4
    coffee_machine = CoffeeMachine.new(coffee, water, milk)
    _output, _error = capture_io do
      coffee_machine.fill_coffee(8)
      coffee_machine.fill_water(10)
      coffee_machine.fill_milk(4)
    end

    cup1_ingredients = { coffee: 2 }
    output, _error = capture_io do
      coffee_machine.make_coffee(cup1_ingredients)
    end
    expected = "You need to specify water and/or milk"
    error_message = "When nor water or coffee are present on the ingredients hash"
    assert_equal  expected, output.lines.last.chomp, error_message
  end

  def test_maintenance_needed_after_500_cups
    skip
    coffee = 8
    water = 10
    milk = 4
    coffee_machine = CoffeeMachine.new(coffee, water, milk)
    cup_ingredients = { coffee: 2, water: 2 }
    _output, _error = capture_io do
      501.times do
        coffee_machine.fill_coffee(2)
        coffee_machine.fill_water(2)
        coffee_machine.make_coffee(cup_ingredients)
      end
    end

    output, _error = capture_io do
      coffee_machine.fill_coffee(2)
      coffee_machine.fill_water(2)
      coffee_machine.make_coffee(cup_ingredients)
    end
    expected = "Machine needs maintenance!"
    error_message = "When more than 500 cups has been served"
    assert_equal  expected, output.lines.last.chomp, error_message
  end

  def test_maintenance_perform_stop_showing_maintenance_message
    skip
    coffee = 8
    water = 10
    milk = 4
    coffee_machine = CoffeeMachine.new(coffee, water, milk)
    cup_ingredients = { coffee: 2, water: 2 }
    _output, _error = capture_io do
      501.times do
        coffee_machine.fill_coffee(2)
        coffee_machine.fill_water(2)
        coffee_machine.make_coffee(cup_ingredients)
      end
    end

    output, _error = capture_io do
      coffee_machine.fill_coffee(2)
      coffee_machine.fill_water(2)
      coffee_machine.make_coffee(cup_ingredients)
    end
    expected = "Machine needs maintenance!"
    error_message = "When more than 500 cups has been served"
    assert_equal  expected, output.lines.last.chomp, error_message

    coffee_machine.perfom_maintenance
    output, _error = capture_io do
      coffee_machine.fill_coffee(2)
      coffee_machine.fill_water(2)
      coffee_machine.make_coffee(cup_ingredients)
    end
    expected = "Your coffee is ready!"
    error_message = "When more than 500 cups has been served and mainteance is performed"
    assert_equal  expected, output.lines.last.chomp, error_message
  end
end
