class Country

  attr_reader :name, :visited, :id

  def initialize(options)
    @name = options['name']
    @visited = options['visited']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO country(
      name ,
      visited)
      VALUES(
      $1, $2)
      RETURNING id"
    values = [@name, @visited]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM country"
    SqlRunner.run( sql )
  end

  def delete()
  sql = "DELETE FROM country
  WHERE id = $1"
  values = [@id]
  SqlRunner.run(sql, values)
  end

  # def self.all()
  #   sql = "SELECT * FROM students"
  #   student_data = SqlRunner.run(sql)
  #   students = map_items(student_data)
  #   return students
  # end



end
