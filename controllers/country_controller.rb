require_relative('../models/country')
also_reload( '../models/*' )

get '/countries_visited' do
  @country = Country.all_bucket_list
  erb( :countries_visited )
end

get '/bucket_list_countries' do
  erb( :bucket_list_countries)
end

get '/city/:id' do
  @country = Country.all
  @city = City.find(params['id'])
  erb(:show)
end
