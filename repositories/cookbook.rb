require 'csv'
require 'pry-byebug'
require 'json'
require_relative '../modals/recipe'

class Cookbook
  def initialize(csv_file_path)
    @recipes = []
    @csv_file_path = csv_file_path
    populate_recipes
  end

  def populate_recipes
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:ingredients] = JSON.parse(row[:ingredients])
      @recipes << Recipe.new(row)
    end
  end

  def all
    @recipes
  end

  def find(index)
    @recipes[index]
  end

  def add_recipe(recipe)
    @recipes << recipe
    save_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    save_csv
  end

  def save_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.open(@csv_file_path, 'wb', **csv_options) do |csv|
      csv << ['name', 'description', 'prep_time', 'ingredients', 'method']
      @recipes.each do |recip|
        csv << [recip.name, recip.description, recip.prep_time, recip.ingredients]
      end
    end
  end
end