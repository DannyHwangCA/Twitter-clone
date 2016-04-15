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


get '/users/:id/following' do
  if session[:user_id]
    @user = User.find(params[:id])
    erb :'users/following'
  else
    session[:errors] = "Please log in to your account"
    redirect '/sessions'
  end
end

get '/users/:id/followers' do
  if session[:user_id]
    @user = User.find(params[:id])
    @user.followers
    erb :'users/followers'
  else
    session[:errors] = "Please log in to your account"
    redirect '/sessions'
  end
end

get '/users/:id/follow/:relationship_id' do
  if params[:id] != session[:user_id]
    session[:errors] = "You are not the user, permission denied."
    redirect '/'
  else
    user = User.find(params[:id])
    another_user = User.find(params[:relationship_id])
    if another_user
      another_user.follow(user)
      redirect "/users/#{params[:id]}/following"
    else
      params[:errors] = (another_user.errors.full_messages)[0]
      redirect '/'
    end
  end
end

get '/users/:id/unfollow/:relationship_id' do
  if params[:id] != session[:user_id]
    session[:errors] = "You are not the user, permission denied."
    redirect '/'
  else
    user = User.find(params[:id])
    another_user = User.find(params[:relationship_id])
    if another_user
      user.unfollow(another_user)
      redirect "/users/#{params[:id]}/following"
    else
      params[:errors] = (another_user.errors.full_messages)[0]
      redirect '/'
    end
  end
end









