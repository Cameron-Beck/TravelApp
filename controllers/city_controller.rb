require_relative('../models/city')
require_relative('../models/country')
also_reload( '../models/*' )


get '/bucket_list_cities' do
  erb( :bucket_list_cities )
end
