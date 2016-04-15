get '/signup' do
  erb :'users/new_user'
end

post '/signup' do
  redirect '/session'
end

get '/profile' do

end

patch '/profile' do

end
