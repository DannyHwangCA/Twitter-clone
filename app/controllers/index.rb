get '/signup' do
  erb :new_user
end

post '/signup' do

  redirect '/'
end
