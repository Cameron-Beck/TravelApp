require( 'sinatra' )
require( 'sinatra/contrib/all' )
require('pry')
require_relative('../models/city')
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

get '/all_countries' do
  @country = Country.all
  erb(:all_countries)
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

get '/add_country_to_bucket_list' do
  erb(:add_country_to_bucket_list)
end

get '/countries_visited/:id/edit_country_v' do
  @country = Country.find(params['id'])
  erb(:edit_country_v)
end

get '/countries_visited/:id/edit_country_bl' do
  @country = Country.find(params['id'])
  erb(:edit_country_bl)
end

post '/country_v/:id' do
  country = Country.new(params)
  country.update
  redirect to "/countries_visited"
end

post '/country_bl/:id' do
  country = Country.new(params)
  country.update
  redirect to "/bucket_list_countries"
end

post '/add_country_to_bucket_list' do
  Country.new(params).save
  redirect to '/bucket_list_countries'
end


get '/cities_visited/:id' do
  @country = Country.find(params['id'])
  @cities = @country.cities()
  erb(:cities_visited)
end

get '/bucket_list_cities/:id' do
  @country = Country.find(params['id'])
  @cities = @country.cities()
  erb(:bucket_list_cities)
end

post '/countries_visited/:id/delete' do
  country = Country.find(params['id'])
  country.delete
  redirect to '/countries_visited'
end

post '/bucket_list_countries/:id/delete' do
  country = Country.find(params['id'])
  country.delete
  redirect to '/bucket_list_countries'
end
