require_relative('../db/sql_runner.rb')

class Country

  attr_reader :name, :visited, :id

  def initialize(options)
    @name = options['name']
    @visited = options['visited']
    @description = options['description']
    @id = options['id'].to_i
  end

  def save()
    sql = "INSERT INTO country(
      name ,
      visited,
      description)
      VALUES(
      $1, $2, $3)
      RETURNING id"
    values = [@name, @visited, @description]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def self.find(id)
    sql = "SELECT * FROM country
    WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values).first
    country = Country.new(result)
    return country
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

  def self.map_items(country_data)
    return country_data.map { |country| Country.new(country) }
  end

  def self.all()
    sql = "SELECT * FROM country"
    country_data = SqlRunner.run(sql)
    countries = map_items(country_data)
    return countries
  end

  def update()
  sql = "UPDATE country
  SET name = $1
  WHERE id = $2"
  values = [@name, @id]
  SqlRunner.run(sql, values)
end


  def self.all_bucket_list()
    sql = "SELECT * FROM country WHERE visited = true"
    country_data = SqlRunner.run(sql)
    countries = map_items(country_data)
    return countries
  end

  def self.all_countries_visited()
    sql = "SELECT * FROM country WHERE visited = false"
    country_data = SqlRunner.run(sql)
    countries = map_items(country_data)
    return countries
  end

end
