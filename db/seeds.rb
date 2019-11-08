require_relative('../models/city.rb')
require_relative('../models/country.rb')


city1 = City.new({
  "name" => "London",
  "visited" => true
  })

city2 = City.new({
  "name" => "Paris",
  "visited" => false
  })

city3 = City.new({
  "name" => "Rome",
  "visited" => true
  })

city4 = City.new({
  "name" => "Berlin",
  "visited" => false
  })

country1 = Country.new({
  "name" => "England",
  "visited" => true
  })

country2 = Country.new({
  "name" => "France",
  "visited" => false
  })

country3 = Country.new({
  "name" => "Italy",
  "visited" => true
  })

country4 = Country.new({
  "name" => "Germany",
  "visited" => false
  })

city1.save()
city2.save()
city3.save()
city4.save()

country1.save()
country2.save()
country3.save()
country4.save()
