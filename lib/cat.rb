class Cat
  # code goes here
  attr_accessor :owner, :mood
  attr_reader :name

  @@all_cats = []

  def initialize(name, owner)
    @name = name
    @mood = "nervous"
    @owner = owner
    @@all_cats << self
  end

  def self.all
    @@all_cats
  end

end