class Dog
  # code goes here
  attr_accessor :owner, :mood
  attr_reader :name

  @@all_dogs = []

  def initialize(name, owner)
    @name = name
    @mood = "nervous"
    @owner = owner
    @@all_dogs << self
  end

  def self.all
    @@all_dogs
  end

end