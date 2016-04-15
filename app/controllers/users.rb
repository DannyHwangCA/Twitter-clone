get '/users/new' do
    erb :'users/new_user'
  end

post '/users/new' do
   user = User.new(username: params[:username], email: params[:email], password: params[:password])
   if user.valid?
    user.save
    session[:success] = "Successfully created!"
    session[:user_id] = user.id
    redirect '/'
  else
    session[:errors] = user.errors.full_messages
    erb :'users/new_user'
  end
 end

get '/users/:id' do
  @user = User.find(params[:id])
  erb :"users/show_user"
end


get '/users/:id/edit' do
   @user = User.find(params[:id])
   erb :"users/edit_user"
end

patch '/users/:id' do
  @user = User.find(params[:id])
  user.update_attributes(username: params[:username], email: params[:email], password: params[:password])
    redirect "/users/#{user.id}" #profile
end

