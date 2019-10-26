class Cat
 
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize(name,owner, mood="nervous") #mood is now optional because the variable is set to nervous
    @name = name
    @owner = owner
    @mood = mood
    @@all << self
  end


  def self.all 
    @@all 
  end


end