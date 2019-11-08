class Country

    attr_reader :name, :visited, :id

    def initialize(options)
      @name = options['name']
      @visited = options['visited']
      @id = options['id'].to_i
    end

    def save()
      sql = "INSERT INTO country
      (
        name ,
        visited
      )
      VALUES
      (
        $1, $2
      )
      RETURNING id"
      values = [@name, @visited]
      results = SqlRunner.run(sql, values)
      @id = results.first()['id'].to_i
    end

    def self.delete_all()
      sql = "DELETE FROM country"
      SqlRunner.run( sql )
    end



end
