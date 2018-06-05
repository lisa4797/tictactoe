require 'sinatra'
require_relative 'tic_tac_toe.rb'
enable :sessions

get '/' do
	erb :splash	
end

post '/play_type' do
	session[:play_type] = params[:play_type]
	redirect '/home'
end

get '/home' do
	play_type = session[:play_type]
	erb :home, :locals => {:play_type => play_type}
end

post '/play' do
	session[:a1] = params[:a1]
	session[:a2] = params[:a2]
	session[:a3] = params[:a3]
	session[:a4] = params[:a4]
	session[:a5] = params[:a5]
	session[:a6] = params[:a6]
	session[:a7] = params[:a7]
	session[:a8] = params[:a8]
	session[:a9] = params[:a9]
	play_type = session[:play_type]
	puts play_type
	redirect '/play'
end

get '/play' do
	a1 = session[:a1]
	a2 = session[:a2]
	a3 = session[:a3]
	a4 = session[:a4]
	a5 = session[:a5]
	a6 = session[:a6]
	a7 = session[:a7]
	a8 = session[:a8]
	a9 = session[:a9]
	play_type = session[:play_type]
	if a1 == "O"
	      a1 = "O"
	elsif a1 == "X"
		  a1 = "X"
	else a1 = """"
	end
	if a2 == "O"
		a2 = "O"
	elsif a2 == "X"
		a2 = "X"
	else a2 = """"
	end
	if a3 == "O"
		a3 = "O"
	elsif a3 == "X"
		a3 = "X"
	else a3 = """"
	end
	if a4 == "O"
		a4 = "O"
	elsif a4 == "X"
		a4 = "X"
	else a4 = """"
	end
	if a5 == "O"
		a5 = "O"
	elsif a5 == "X"
		a5 = "X"
	else a5 = """"
	end
	if a6 == "O"
		a6 = "O"
	elsif a6 == "X"
		a6 = "X"
	else a6 = """"
	end
	if a7 == "O"
		a7 = "O"
	elsif a7 == "X"
		a7 = "X"
	else a7 = """"
	end
	if a8 == "O"
		a8 = "O"
	elsif a8 == "X"
		a8 = "X"
	else a8 = """"
	end
	if a9 == "O"
		a9 = "O"
	elsif a9 == "X"
		a9 = "X"
	else a9 = """"
	end
	if play_type == "easy"
		play_type = "easy"
	elsif play_type == "hard"
		play_type = "hard"
	else play_type = """"
	end	
	if play_type == "hard"
		result = computer_move(a1, a2, a3, a4, a5, a6, a7, a8, a9)
		puts "computer move is #{result}"
	elsif play_type == "easy"
		result = plays_random(a1, a2, a3, a4, a5, a6, a7, a8, a9)
		puts "random is #{result}"
	end
	
	if result == "a1"
		a1 = "O"
	elsif result == "a2"
		a2 = "O"
	elsif result == "a3"
		a3 = "O"
	elsif result == "a4"
		a4 = "O"
	elsif result == "a5"
		a5 = "O"
	elsif result == "a6"
		a6 = "O"
	elsif result == "a7"
		a7 = "O"
	elsif result == "a8"
		a8 = "O"
	elsif result == "a9"
		a9 = "O"
	end
	erb :play, :locals => {:a1 => a1, :a2 => a2, :a3 => a3, :a4 => a4, :a5 => a5, :a6 => a6, :a7 => a7, :a8 => a8, :a9 => a9, :play_type => play_type}
end