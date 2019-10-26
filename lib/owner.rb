require 'pry'

class Owner
  
  attr_reader :name, :species
  @@all = []

  def initialize(name,species="human")
    @species = species
    @name = name
    @@all << self
  end

  def say_species
    p "I am a #{@species}."
  end

  def self.count
    @@all.count
  end

 

  def self.reset_all    
    @@all = []
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

  def buy_cat(name)
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end


  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end


  def walk_dogs
    dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    owner_animals = self.dogs + self.cats

    owner_animals.each do |animal|
      animal.mood = 'nervous'
      animal.owner = nil
    end

  def list_pets
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end


  end





  def self.all 
    @@all
  end


  # binding.pry


end



# a = Owner.new('Matthew')
# puts a.species
