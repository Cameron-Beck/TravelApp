require_relative('../db/sql_runner.rb')

class City

  attr_reader :name, :visited, :id, :country_id

  def initialize( options )
    @id = options['id'].to_i
    @country_id = options['country_id'].to_i
    @name = options['name']
    @visited = options['visited']
  end



  def save()
    sql = "INSERT INTO city
    (
      name ,
      visited,
      country_id
    )
    VALUES
    (
      $1, $2, $3
    )
    RETURNING id"
    values = [@name, @visited, @country_id]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

end
