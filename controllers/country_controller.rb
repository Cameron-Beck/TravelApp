require_relative('../models/country')
also_reload( '../models/*' )

get '/countries_visited' do
  @country = Country.all
  erb( :countries_visited )
end

get '/bucket_list_countries' do
  erb( :bucket_list_countries)
end
