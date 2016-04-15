get '/users/:user_id/posts' do
  @posts = Post.where(user_id: params[:user_id])
  erb :loggedin_index
end

post '/users/:user_id/posts' do
  Post.create(content: params[:post], user_id: params[:user_id])
  redirect '/users/:user_id/posts'
end

get '/users/:user_id/posts/:post_id' do
  @post = Post.find_by(id: params[:post_id])
  erb :show_post
end

patch '/users/:user_id/posts/:post_id' do
  @post = Post.update_attributes(content: params[:content])
end
