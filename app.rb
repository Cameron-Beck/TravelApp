require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/city_controller.rb')
require_relative('controllers/country_controller.rb')
also_reload( '../models/*' )

get '/' do
  erb( :home )
end
