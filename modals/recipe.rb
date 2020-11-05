class Recipe
  attr_reader :name, :description, :prep_time, :ingredients, :recipe_method

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @prep_time = attributes[:prep_time]
    @ingredients = attributes[:ingredients]
    @recipe_method = attributes[:recipe_method]
  end
end