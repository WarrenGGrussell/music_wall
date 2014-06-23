# Homepage (Root path)
get '/' do
  erb :index
end

get '/tunes' do
  @tunes = Tune.all 
  erb :'tunes/index'
end

get '/tunes/new' do 
  erb :new
end

