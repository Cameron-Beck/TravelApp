require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/city')
require_relative('../models/country')
also_reload( '../models/*' )


get '/bucket_list_cities' do
  erb( :bucket_list_cities )
end

get '/all_cities' do
  @city = City.all
  erb(:all_cities)
end

get '/add_city_to_bucket_list' do
  erb(:add_city_to_bucket_list)
end

post '/add_city_to_bucket_list' do
  City.new(params).save
  redirect to '/cities_visited'
end

get '/add_city_to_visited' do
  @city = City.find(params['id'])
  @cities = City.all
  erb(:add_city_to_visited)
end

post '/add_city_to_visited' do
  City.new(params).save
  redirect to '/cities_visited'
end
