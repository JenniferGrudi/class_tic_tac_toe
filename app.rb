require 'sinatra'
require_relative 'board_logic.rb'
require_relative 'sequential_ai.rb'
require_relative 'simple_ai.rb'
require_relative 'AI_game.rb'
require_relative 'human.rb'


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

		if p1_marker == "X"
		   p2_marker = "O"
		else
			p2_marker = "X"
		end	

		if session[:one] == "Simple AI"
			player_one = {:player_mode => Simple.new, :marker => p1_marker}
		else session[:one] == "Sequential AI"
			player_one = {:player_mode => Sequential.new, :marker => p1_marker}
		end

		if session[:two] == "Simple AI"
			player_two = {:player_mode => Simple.new, :marker => p2_marker}
		else session[:two] == "Sequential AI"
			player_two = {:player_mode => Sequential.new, :marker => p2_marker}
		end	

 session[:board] = create_new_board
 session[:board] = play_game(player_one, player_two, session[:board])

 erb :play_game, :locals => {:p1_marker => p1_marker, :p2_marker => p2_marker,:player_one => session[:one], :player_two => session[:two], :board => session[:board]}

human = params[:human]

		if session[:one] == "Human" && session[:two] == "Human"
			player_one = {:player_mode => Human.new, :marker => p1_marker}
			player_two = {:player_mode => Human.new, :marker => p2_marker}
		elsif
			session[:one] == "Human" && session[:two] == "Simple_AI"
			player_one = {:player_mode => Human.new, :marker => p1_marker}
			player_two = {:player_mode => Simple.new, :marker => p2_marker}
		else
			session[:one] == "Human" && session[:two] == "Sequential"
			player_one = {:player_mode => Human.new, :marker => p1_marker}
			player_two = {:player_mode => Sequential.new, :marker => p2_marker} 			
		end

 erb :human_game, :locals => {:p1_marker => p1_marker, :p2_marker => p2_marker,:player_one => session[:one], :player_two => session[:two], :board => session[:board], :human => human}	





end

