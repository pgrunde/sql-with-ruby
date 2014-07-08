require "database_connection"

class SqlExercise

  attr_reader :database_connection

  def initialize
    @database_connection = DatabaseConnection.new
  end

end
