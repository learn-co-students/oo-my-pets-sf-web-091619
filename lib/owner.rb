require 'pry'
class Owner
  # code goes here
  attr_reader :name
  @@all = []
  def initialize(name = nil)
    @name = name
    @species = "human"
    @@all << self
  end
  def species
    @species
  end
  def say_species
    p "I am a #{@species}."
  end
  def self.all
    @@all
  end
  def self.count
    @@all.length
  end
  def self.reset_all
    @@all.clear
  end
  def cats
    Cat.all.select do |cat|
      self == cat.owner 
    end
  end
  def dogs
    Dog.all.select do |dog|
      self == dog.owner
    end
  end
  def buy_cat(name)
    Cat.new(name, self)
  #   Cat.all.each do |cat|
  #     if cat.name == name
  #       cat.owner = self
  #     end
  #   end
  end
  def buy_dog(name)
    Dog.new(name, self)
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
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
