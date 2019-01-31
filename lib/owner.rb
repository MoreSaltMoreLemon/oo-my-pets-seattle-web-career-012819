class Owner
  
  attr_accessor :name, :pets
  attr_reader :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @pets = { fishes: [], dogs: [], cats: [] }
    @@all << self
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

  def say_species
    "I am a #{species}."
  end

  def buy_fish(name)
    buy_pet(name, :fishes, Fish)
  end

  def buy_cat(name)
    buy_pet(name, :cats, Cat)
  end

  def buy_dog(name)
    buy_pet(name, :dogs, Dog)
  end

  def buy_pet(name, pet_type, pet_class)
    @pets[pet_type] << pet_class.new(name)
  end

  def walk_dogs
    interact_with_pet(:dogs)
  end

  def feed_fish
    interact_with_pet(:fishes)
  end

  def play_with_cats
    interact_with_pet(:cats)
  end

  def interact_with_pet(pet_type)
    @pets[pet_type].each do |pet|
      pet.mood = "happy"
    end
  end

  def sell_pets
    @pets.each do |pet_kind, pets|
      pets.each do |pet|
        pet.mood = "nervous"
      end
    end
    @pets.clear
  end

  def list_pets
    fish_count = @pets[:fishes].count
    dog_count = @pets[:dogs].count
    cat_count = @pets[:cats].count
    "I have #{fish_count} fish, #{dog_count} dog(s), and #{cat_count} cat(s)."
  end

end