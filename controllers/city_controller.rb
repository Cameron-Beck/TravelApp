require_relative('../models/city')
require_relative('../models/country')
also_reload( '../models/*' )


get '/bucket_list_cities' do
  erb( :bucket_list_cities )
end

get '/cities_visited/:id' do
  @cities = City.cities_by_country
  @City = City.find(params['id'])
  erb(:cities_visited)
end
