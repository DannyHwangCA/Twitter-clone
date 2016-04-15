get '/users/signup' do
    erb :'users/new_user'
  end
  
post '/users/signup' do
   user = User.create(username: params[:username], email: params[:email], password: params[:password])
   session[:success] = user
   redirect '/loggedin_index'
 end
  
get '/users/:id/edit' do
   @user = User.find(params[:id])
   erb :edit_user
end
  
patch '/users/:id' do
  user = User.find(params[:id])
  user.update_attributes(username: params[:username], email: params[:email], password: params[:password])
    redirect '/users/show' #profile
  end
