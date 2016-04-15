get '/sessions' do
  erb :"sessions/login"
end

post '/sessions' do
  user = User.find_by(username: params[:username])
  if user.authenticate(params[:password])
    session[:user_id] = user.id
    redirect '/'
  else
    erb :"sessions/login"
  end
end

get '/logout' do
  session.clear
  redirect '/sessions'
end
