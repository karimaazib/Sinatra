require 'sinatra'
require 'gossip'
class ApplicationController < Sinatra::Base
	get '/' do
  		erb :index, locals: {gossips: Gossip.all}
	end
	get '/gossips/new/' do
  		erb :new_gossip
  	end 

  	post '/gossips/new/' do
  	Gossip.new(params["gossip_author"], params["gossip_content"]).save
  	  # ton super code qui enregistre un gossip en fonction de params
  	redirect '/'
	end

	get '/gossips/:id/' do
        erb :show, locals: {gossips: Gossip.find(params[:id])}
  
    end
end 