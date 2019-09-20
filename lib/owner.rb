require 'pry'
class Owner
  attr_reader :name, :species
  @@all =[]
  def initialize(name)
    @name = name
    @species = 'human'
    @@all << self
  end

  def say_species
    p "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    dogs.each do |dog|
        dog.mood = 'happy'
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = 'happy'
    end
  end

  def sell_pets
    dogs.each do |dog| 
      dog.mood = 'nervous'
      dog.owner = nil
    end

    cats.each do |cat|
      cat.mood = 'nervous'
      cat.owner = nil
    end
  end

  def list_pets
    p "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end
end