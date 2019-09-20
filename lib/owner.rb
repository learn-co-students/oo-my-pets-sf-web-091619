require 'pry'
class Owner

  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def cats
    Cat.all.select { |info| info.owner == self }
  end

  def dogs
    Dog.all.select { |info| info.owner == self }
  end

  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
  end

  def walk_dogs
    dogs.each { | info | 
      info.mood = "happy"
    }
  end

  def feed_cats
    cats.each { |info|
      info.mood = "happy"
    }
  end

  def sell_pets
    dogs.each { |info| 
      info.mood = "nervous" 
      info.owner = nil
    }
    cats.each { |info| 
      info.mood = "nervous"
      info.owner = nil
    } 
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

  def self.all
    @@all
  end
  def self.count
    @@all.count
  end
  def self.reset_all
    @@all = []
  end
end