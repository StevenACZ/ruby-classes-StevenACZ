class CoffeeMachine
  def initialize(coffee, water, milk)
    @coffee = coffee
    @water = water
    @milk = milk
    @coffee_count = 0
  end

  def coffee_cap
    @coffee
  end

  def water_cap
    @water
  end

  def milk_cap
    @milk
  end

  def fill_coffee(amount)
    if amount > @coffee
      puts "Too much! Only #{@coffee} free"
    else
      puts "Coffee new level #{@coffee - amount}/#{@coffee}"
      @coffee -= amount
    end
  end

  def fill_water(amount)
    if amount > @water
      puts "Too much! Only #{@water} free"
    else
      puts "Coffee new level #{@water - amount}/#{@water}"
      @water -= amount
    end
  end

  def fill_milk(amount)
    if amount > @milk
      puts "Too much! Only #{@milk} free"
    else
      puts "Coffee new level #{@milk - amount}/#{@milk}"
      @milk -= amount
    end
  end

  def make_coffee(ingredients)
    if ingredients[:coffee] <= @coffee && ingredients[:water] <= @water && ingredients[:milk] <= @milk
      coffee_ready
    elsif ingredients[:water] > @water && ingredients[:milk] > @milk
      need_milk_or_water
    else
      not_enough_ingredient
    end
  end

  attr_reader :coffee_count

  def perfom_maintenance
    @coffee_count = 0
  end

  def coffee_ready
    puts "Your coffee is ready!"
    @coffee -= ingredients[:coffee]
    @water -= ingredients[:water]
    @milk -= ingredients[:milk]
    @coffee_count += 1
    @coffee_count >= 500 && puts("Machine needs maintenance!")
  end

  def need_milk_or_water
    puts "You need to specify water and/or milk"
    @water -= ingredients[:water]
    @milk -= ingredients[:milk]
  end

  def not_enough_ingredient
    if ingredients[:coffee] > @coffee
      puts "Not enough #{ingredients.keys[0]}"
    elsif ingredients[:water] > @water
      puts "Not enough #{ingredients.keys[1]}"
    else
      puts "Not enough #{ingredients.keys[2]}"
    end
  end
end
