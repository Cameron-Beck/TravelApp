require_relative('../models/city')
require_relative('../models/country')
also_reload( '../models/*' )


get '/bucket_list_cities' do
  erb( :bucket_list_cities )
end

get '/cities_visited/:id' do
  @city = City.find(params['id'])
  @cities = City.all
  erb(:cities_visited)
end
