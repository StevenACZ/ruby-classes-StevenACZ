class Person
  def initialize(name)
    @name = name

    @hunger = 20
    @sleepyness = 10
    @stamina = 80
  end

  def status
    puts "My name is #{@name}, this is my status:"
    puts "Hunger: #{@hunger}"
    puts "Sleepyness: #{@sleepyness}"
    puts "Stamina: #{@stamina}"

    alert_hunger
    alert_sleepyness
    alert_stamina
  end

  def exercise(intensity)
    case intensity
    when "low" then low_intensity
    when "medium" then medium_intensity
    when "hight" then hight_intensity
    end
  end

  def sleep
    @hunger += 20
    @sleepyness = 0
    @stamina = 100
    puts "I have slept"
  end

  def study
    @hunger += 25
    @sleepyness += 30
    @stamina -= 10
    puts "I have studied"
  end

  def eat(food)
    @hunger += food.effects[:hunger]
    @sleepyness += food.effects[:sleepyness]
    @stamina += food.effects[:stamina]

    puts "That #{food.name} tasted #{food.taste}!"
    puts "I have eaten"
  end

  def low_intensity
    puts "I have exercised at low intensity"
    @stamina -= 10
    @hunger += 10
  end

  def medium_intensity
    puts "I have exercised at medium intensity"
    @stamina -= 25
    @hunger += 30
  end

  def hight_intensity
    puts "I have exercised at high intensity"
    @stamina -= 50
    @hunger += 60
  end

  def alert_hunger
    case @hunger
    when 100 then puts "I am very hungry"
    when 0 then puts "I am satiated"
    end
  end

  def alert_sleepyness
    case @sleepyness
    when 100 then puts "I need to sleep"
    when 0 then puts "I am totally rested"
    end
  end

  def alert_stamina
    case @stamina
    when 100 then puts "I have a lot of energy"
    when 0 then puts "I'm tired"
    end
  end
end

class Children < Person
  def initialize(name)
    super
    @hunger = 100
  end

  def eat(food)
    @hunger += food.effects[:hunger] * 0.80
    @sleepyness += food.effects[:sleepyness] * 1.10
    @stamina += food.effects[:stamina] * 1.20

    puts "That #{food.name} tasted #{food.taste}!"
    puts "I have eaten"
  end
end

class Food
  attr_reader :name, :taste

  def initialize(name, taste)
    @name = name
    @taste = taste
  end

  def effects
    case @taste
    when "dessert" then effects_dessert
    when "meal" then effects_meal
    when "energizer" then effects_energizer
    end
  end

  def effects_dessert
    {
      hunger: -20,
      sleepyness: 0,
      stamina: 10
    }
  end

  def effects_meal
    {
      hunger: -50,
      sleepyness: 10,
      stamina: 25
    }
  end

  def effects_energizer
    {
      hunger: -10,
      sleepyness: -50,
      stamina: 50
    }
  end
end
