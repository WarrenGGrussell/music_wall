# Homepage (Root path) This is Sinatra
get '/' do
  erb :index
end

get '/tunes' do
  @tunes = Tune.all 
  erb :'tunes/index'
end

get '/tunes/new' do
  #@tune = Tune.new 
  erb :'tunes/new'
end

post '/tunes' do
  @tune = Tune.new(
    song_title: params[:song_title],
    author: params[:author]
  )
  if @tune.save
    redirect '/tunes'
  else
    erb :'tunes/new'
  end
end

get '/tunes/:id' do
  @tune = Tune.find params[:id]
  erb :'tunes/show'
end

get '/login' do 
  erb :'auth/login'
end

get '/signup' do
  erb :'auth/signup'
end

post '/signup' do
  @user = User.new(
    email: params[:email],
    password: params[:password]
  )

  if @user.save
    session[:user_id] = @user.id
    redirect '/tunes'
  else
    erb :'auth/signup'
  end
end

post '/login' do
  @user = User.find_by(email: params[:email], password: params[:password])

  if @user
    session[:user_id] = @user.id
    redirect '/tunes'
  else
    erb :'auth/login'
  end
end

post '/logout' do
  session[:user_id] = nil
  redirect '/'
end





