require 'sinatra'
require 'sinatra/reloader' if development?
require 'better_errors'
require 'pry-byebug'
require 'json'
require_relative 'repositories/cookbook'
require_relative 'modals/recipe'
set :bind, '0.0.0.0'
configure :development do
  use BetterErrors::Middleware
  BetterErrors.application_root = File.expand_path('..', __FILE__)
end

csv_file = File.join(__dir__, 'data/recipes.csv')
$cookbook = Cookbook.new(csv_file)

get '/' do
  @recipes = $cookbook.all
  erb :index
end

get '/new' do
  erb :new
end

post '/recipes' do
  recipe_name = params[:recipe_name]
  recipe_description = params[:description]
  prep_time = params[:prep_time]
  ingredients = JSON.parse(params[:ingredients]) # => Needs to be array of ingredients, currently is a String
  # Create new Recipe
  recipe = Recipe.new(name: recipe_name, description: recipe_description, prep_time: prep_time, ingredients: ingredients)
  # Add to Cookbook repo
  $cookbook.add_recipe(recipe)
  redirect '/'
end

delete '/delete/:id' do
  $cookbook.remove_recipe(params[:id].to_i)
  redirect '/'
end

get '/recipe_view/:index' do
  @recipe = $cookbook.find(params[:index].to_i)
  erb :recipe_view
end
