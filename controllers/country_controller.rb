require_relative('../models/country')
also_reload( '../models/*' )

get '/countries_visited' do
  @country = Country.all_bucket_list
  erb(:countries_visited )
end

get '/bucket_list_countries' do
  @country = Country.all_countries_visited
  erb(:bucket_list_countries)
end

get '/add_country_to_visited' do
  erb(:add_country_to_visited)
end

get '/add_new_country' do
  erb(:add_new_country)
end

post '/add_country_to_visited' do
  Country.new(params).save
  redirect to '/countries_visited'
end

get '/city/:id' do
  @country = Country.all
  @city = City.find(params['id'])
  erb(:show)
end

post '/students/:id/delete' do
  country = Country.find(params['id'])
  country.delete
  redirect to '/bucket_list_countries'
end
