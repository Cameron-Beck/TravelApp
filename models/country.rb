class Country

    attr_reader(:name, :visited, :id)

    def initalize(options)
      @name = options['name']
      @visited = options['visited']
      @id = options['id'].to_i
    end

    def



end
