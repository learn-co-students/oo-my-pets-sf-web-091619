class Owner
  # code goes here
  attr_reader :name, :species
  attr_accessor :say_species, :pets

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    return "I am a #{@species}."
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
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    p "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end




  # def list_pets
  #   Cat.all.select do |cat|
  #   cat.owner == self
  #   end
  # end


  # Class Methods

  def self.all
    @@all
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

end