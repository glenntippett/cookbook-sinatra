class User
  attr_reader :username, :password
  attr_accessor :id

  def initialize(attributes = {})
  @id = attributes[:id]
  @username = attributes[:username]
  @password = attributes[:password]
end