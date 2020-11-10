require 'csv'
require_relative '../modals/user.rb'

CSV_OPTIONS = { headers: :first_row, header_converters: :symbol }

class UserRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @users = []
    load_csv if File.exist?(@csv_file_path)
  end

  def find(id)
    @users.find { |user| user.id == id }
  end

  private
  
  def load_csv
    CSV.foreach(@csv_file_path, CSV_OPTIONS) do |row|
      row[:id] = row[:id].to_i
      @users << User.new(row)
      @next_id = row[:id] + 1
    end
  end
end