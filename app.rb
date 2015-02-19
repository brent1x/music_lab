require 'sinatra'
require 'sinatra/activerecord'
require './models/musician'

get '/' do
  redirect '/musicians'
end

get '/musicians' do
  @musicians = Musician.all
  erb :index
end

get '/musicians/new' do
  erb :new
end

## 

get '/musicians/:id' do
  @musician = Musician.find(params[:id])
  erb :show
end

get '/musicians/:id/edit' do
  @musician = Musician.find(params[:id])
  erb :edit
end

post '/musicians' do
  Musician.create({:name => params[:name]})
  redirect '/musicians'
end

put '/musicians/:id' do
  musician = Musician.find(params[:id])
  musician.name = params[:name]
  musician.save
  redirect '/musicians'
end

delete '/musicians/:id' do
  musician = Musician.find(params[:id])
  musician.destroy
  redirect '/musicians'
end
