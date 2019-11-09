require_relative('../models/city')
require_relative('../models/country')
also_reload( '../models/*' )


get '/bucket_list_cities' do
  erb( :bucket_list_cities )
end

get '/city/:id' do
  @city2 = City.all
  @cities = City.cities_by_country
  @city = City.find(params['id'])
  erb(:show)
end
