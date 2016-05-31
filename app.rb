require 'sinatra'
require_relative 'board_logic.rb'
require_relative 'sequential_ai.rb'
require_relative 'simple_ai.rb'
require_relative 'AI_game.rb'

enable :sessions

get '/' do
	erb :choose_player
end	

post '/input' do
	session[:one] = params[:player_one]
	session[:two] = params[:player_two]
	erb :player_one_marker, :locals => {:player_one => session[:one], :player_two => session[:two]}
end

post '/player_one_marker' do
	p1_marker = params[:p1_marker]
	p2_marker = params[:p2_marker]
	session[:board] = params[:board]
	session[:name] = params[:user_name]

		if p1_marker == "X"
		   p2_marker = "O"
		else
			p2_marker = "X"
		end	

		if session[:one] == "Human"
			player_one = {:player_mode => "Human", :marker => p1_marker}
		elsif session[:one] == "Simple AI"
			  player_one = {:player_mode => Simple.new, :marker => p1_marker}
		else session[:one] == "Sequential AI"
			player_one = {:player_mode => Sequential.new, :marker => p1_marker}
		end

		if session[:two] == "Human"
		 	player_two = {:player_mode => "Human", :marker => p2_marker}	
		elsif session[:two] == "Simple AI"
			player_two = {:player_mode => Simple.new, :marker => p2_marker}
		else session[:two] == "Sequential AI"
			player_two = {:player_mode => Sequential.new, :marker => p2_marker}
		end

		# if session[:name] == session[:player_one]
		# 	session[:name] = session[:player_two]
		# else
		# 	session[:name] = session[:player_one]
		# end		

 session[:player_one] = player_one
 session[:player_two] = player_two
 session[:board] = create_new_board
 session[:current_player] = session[:player_one]	

 erb :play_game, :locals => {:board => session[:board], :p1_marker => p1_marker, :p2_marker => p2_marker, :name => session[:name]}
end 

post '/play_game' do

		if session[:current_player][:player_mode] == "Human"
			erb :human_game, :locals => {:board => session[:board]}
		else 
			session[:move] = session[:current_player][:player_mode].get_move(session[:board])
			redirect '/make_move'
		end	
end

get '/make_move' do
	session[:board] = update_board(session[:board], session[:move], session[:current_player][:marker])

	 if game_over?(session[:board], session[:current_player][:marker])
	 	if winner?(session[:board], session[:current_player][:marker])
	 		"You have won #{session[:current_player][:marker]}!"
	 	else
	 		cats_game?(session[:board])
	 		"It's a tie!"
	 	end	

	 else
	 	if session[:current_player] == session[:player_one]
	 	   session[:current_player] = session[:player_two]
	 	else
	 	   session[:current_player] = session[:player_one]
	 	end
	 		
	 	erb :play_game, :locals => {:name => session[:name], :board => session[:board], :p1_marker => session[:player_one][:marker], :p2_marker => session[:player_two][:marker]}	
	 end	

get '/switchplayers' do
	if session[:current_player][:player_mode] == "Human"
		redirect '/switchhumanplayers'
	elsif session[:current_player] == session[:player_one]
		session[:current_player] = session[:player_two]
	else
		session[:current_player] = session[:player_one]
	end
	erb :play_game, :locals => {:name => session[:name], :board => session[:board], :p1_marker => session[:player_one][:marker], :p2_marker => session[:player_two][:marker]}
end

get '/switchhumanplayers' do
	if session[:current_player] == session[:player_one]
		session[:current_player] = session[:player_two]
	else
		session[:current_player] = session[:player_one]
	end
	if session[:current_player][:player_mode] != "Human"
		erb :play_game, :locals => {:player_one_marker => session[:player_one_marker], :player_two_marker => session[:player_two_marker], :board => session[:board]}
	elsif session[:current_player] == session[:player_one]
		erb :human_game, :locals => {:board => session[:board], :current_player => session[:name]}
	else 
		erb :human_game, :locals => {:board => session[:board], :current_player => "Player two"}
	end
end
end	
post '/human_game' do
	session[:move] = params[:move].to_i
	redirect '/make_move'
end	




