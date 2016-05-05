require 'sinatra'
require_relative 'board_logic.rb'
require_relative 'AI_game.rb'

enable :sessions

get '/' do
	erb :choose_player
end	

post '/input' do
	session[:one] = params[:player_one]
	session[:two] = params[:player_two]
	erb :player_one_marker, :locals => {:p1 => session[:one], :p2 => session[:two]}
end

post '/player_marker' do
	p1_marker = params[:p1_marker]
	p2_marker = params[:p2_marker]

		if p1_marker == "X"
			   p2_marker = "O"
		else
				p2_marker = "X"

		end	
	erb :play_game, :locals => {:p1_marker => p1_marker, :p2_marker => p2_marker,:p1 => session[:one], :p2 => session[:two], :board => create_new_board}
end	

post '/play_game' do
	board = params[:board] 
	move_one = params[:move_one]


	erb :first_move, :locals => {:board => create_new_board, :move_one => get_move_seq}
end	

