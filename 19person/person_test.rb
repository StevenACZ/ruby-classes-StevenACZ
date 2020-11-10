require "minitest/autorun"
require_relative "person"

class PersonTest < Minitest::Test
  def test_person_respond_to_initial_values
    # skip
    sam = Person.new("Sam")

    output, _error = capture_io do
      sam.status
    end

    expected = [
      "My name is Sam, this is my status:",
      "Hunger: 20",
      "Sleepyness: 10",
      "Stamina: 80"
    ].join("\n")

    assert_equal expected, output.chomp
  end

  def test_person_can_exercise
    skip
    sam = Person.new("Sam")

    output, _error = capture_io do
      sam.exercise("low")
      sam.exercise("medium")
      sam.exercise("high")
    end

    expected = [
      "I have exercised at low intensity",
      "I have exercised at medium intensity",
      "I have exercised at high intensity"
    ].join("\n")

    assert_equal expected, output.chomp
  end

  def test_person_can_sleep
    skip
    sam = Person.new("Sam")

    output, _error = capture_io do
      sam.sleep
    end

    expected = "I have slept"
    assert_equal expected, output.chomp
  end

  def test_person_can_study
    skip
    sam = Person.new("Sam")

    output, _error = capture_io do
      sam.study
    end

    expected = "I have studied"
    assert_equal expected, output.chomp
  end

  def test_person_can_eat_food
    skip
    sam = Person.new("Sam")
    icecream = Food.new("Ice cream", "dessert", "very sweet")

    output, _error = capture_io do
      sam.eat(icecream)
    end

    expected = [
      "I have eaten",
      "That Ice cream tasted very sweet!"
    ].join("\n")
    assert_equal expected, output.chomp
  end

  def test_status_report_with_status_alerts
    skip
    sam = Person.new("Sam")

    _output, _error = capture_io do
      sam.exercise("high")
      sam.exercise("high")
    end

    output, _error = capture_io do
      sam.status
    end

    expected = [
      "My name is Sam, this is my status:",
      "Hunger: 100",
      "Sleepyness: 10",
      "Stamina: 0",
      "I am very hungry",
      "I'm tired"
    ].join("\n")
    assert_equal expected, output.chomp
  end

  def test_status_report_with_status_alerts_with_food
    skip
    sam = Person.new("Sam")
    icecream = Food.new("Ice cream", "dessert", "very sweet")
    pizza = Food.new("Pizza", "meal", "nice")
    coffee = Food.new("Coffee", "energizer", "bitter")

    _output, _error = capture_io do
      sam.eat(icecream)
      sam.eat(pizza)
      sam.eat(coffee)
    end

    output, _error = capture_io do
      sam.status
    end

    expected = [
      "My name is Sam, this is my status:",
      "Hunger: 0",
      "Sleepyness: 0",
      "Stamina: 100",
      "I am satiated",
      "I am totally rested",
      "I have a lot of energy"
    ].join("\n")
    assert_equal expected, output.chomp
  end

  def test_children_initialize_with_hunger
    skip
    sammy = Children.new("Sammy")

    output, _error = capture_io do
      sammy.status
    end

    expected = [
      "My name is Sammy, this is my status:",
      "Hunger: 100",
      "Sleepyness: 10",
      "Stamina: 80",
      "I am very hungry"
    ].join("\n")
    assert_equal expected, output.chomp
  end

  def test_children_eat_food_differently
    skip
    sammy = Children.new("Sammy")
    icecream = Food.new("Ice cream", "dessert", "very sweet")

    _output, _error = capture_io do
      sammy.eat(icecream)
    end

    output, _error = capture_io do
      sammy.status
    end

    expected = [
      "My name is Sammy, this is my status:",
      "Hunger: 84",
      "Sleepyness: 10",
      "Stamina: 92"
    ].join("\n")
    assert_equal expected, output.chomp
  end
end
