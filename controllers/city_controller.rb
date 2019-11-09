require_relative('../models/city')
require_relative('../models/country')
also_reload( '../models/*' )


get '/bucket_list_cities' do
  erb( :bucket_list_cities )
end

get '/city/:id' do
  @country = Country.all
  @city = City.find(params['id'])
  erb(:show)
end
