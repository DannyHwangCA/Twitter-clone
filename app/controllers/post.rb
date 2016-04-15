get '/users/:user_id/posts' do
  @user = User.find(params[:user_id])
  @posts = Post.where(user_id: params[:user_id])
  erb :loggedin_index
end

post '/users/:user_id/posts' do
  @posts = Post.create(content: params[:tweet], user_id: params[:user_id])
  redirect "/users/#{@posts.user_id}/posts"
end

get '/users/:user_id/posts/:post_id' do
  @post = Post.find_by(id: params[:post_id])
  erb :'posts/show_post'
end

patch '/users/:user_id/posts/:post_id' do
  @post = Post.find(params[:post_id])
  @post.content = params[:content]
  @post.save
  redirect "/users/#{@post.user_id}/posts/#{@post.id}"
end
