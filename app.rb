require 'sinatra'
require_relative 'board_logic.rb'
require_relative 'sequential_ai.rb'
require_relative 'simple_ai.rb'
require_relative 'AI_game.rb'
require_relative 'console_game.rb'


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
	# p2_marker = params[:p2_marker]

		if p1_marker == "X"
		   player_one_marker = "X"
		   player_two_marker = "O"
		else
		    player_one_marker = "O"
			player_two_marker = "X"
		end	

		if session[:one] == "Simple AI"
			player_one = {:player_mode => Simple.new, :marker => player_one_marker}
		else session[:one] == "Sequential AI"
			player_one = {:player_mode => Sequential.new, :marker => player_one_marker}
		end

		if session[:two] == "Simple AI"
			player_two = {:player_mode => Simple.new, :marker => player_two_marker}
		else session[:two] == "Sequential AI"
			player_two = {:player_mode => Sequential.new, :marker => player_two_marker}
		end

	board = create_new_board
	board = play_game(player_one, player_two, board)

	erb :play_game, :locals => {:player_one_marker => player_one_marker, :player_two_marker => player_two_marker,:player_one => session[:one], :player_two => session[:two], :board => board}
end	

post '/human' do
	human = params[:human]
	if player_one 

	erb :human_game, :locals => {:player_one_marker => player_one_marker, :player_two_marker => player_two_marker,:player_one => session[:one], :player_two => session[:two], :board => board}
end


