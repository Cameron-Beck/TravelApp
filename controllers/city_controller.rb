require_relative('../models/city')
also_reload( '../models/*' )

get '/cities_visited' do
  erb( :cities_visited )
end

get '/bucket_list_cities' do
  erb( :bucket_list_cities )
end

get '/city/:id' do
  @city = City.find(params['id'])
  erb(:show)
end
