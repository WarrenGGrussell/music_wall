# Homepage (Root path)
get '/' do
  erb :index
end

get '/tunes' do
  @tunes = Tune.all 
  erb :'tunes/index'
end

get '/tunes/new' do 
  erb :'tunes/new'
end

post '/tunes' do
  @tune = Tune.new(
    song_title: params[:song_title],
    author: params[:author]
  )
  @tune.save
  redirect '/tunes/new'
end

