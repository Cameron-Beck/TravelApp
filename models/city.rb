require_relative('../db/sql_runner.rb')

class City

  attr_reader(:name, :visited, :id, :country_id)

  def initalize(options)
    @id = options['id']to_i
    @country_id['country_id']to_i
    @name = options['name']
    @visited = options['visited']
  end
end
