class Recipe
  attr_reader :name, :description, :rating, :read, :prep_time

  def initialize(name, description, rating, prep_time, read = false)
    @name = name
    @description = description
    @rating = rating
    @read = read
    @prep_time = prep_time
  end

  def read?
    @read
  end

  def mark_as_read!
    @read = true
  end
end
