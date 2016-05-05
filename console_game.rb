# require_relative "AI_game.rb"
# require_relative "human.rb"

# def choose_player_mode()
# 	puts "Would you like Player 1 to be human or AI?"
# 	answer = gets.chomp
# 	player_one = player_one_mode(answer)
# 	puts "Would you like Player 2 to be human or an AI?"
# 	answer = gets.chomp
# 	player_two = player_two_mode(answer)
# 	board = play_game(player_one, player_two, create_new_game_board)
# 	display_board(board)
# end

# def player_one_mode(answer)
# 	if answer.downcase == "human"
# 		player_one = {:player_mode => Human.new, :marker => "X"}
# 		puts "Player 1 is X."
# 	elsif answer.downcase == "ai"
# 		puts "Would you like the AI to be simple or sequential?"
# 		answer = gets.chomp
# 		if answer.downcase == "simple"
# 			player_one = {:player_mode => Simple.new, :marker => "X"}
# 		elsif answer.downcase == "sequential"
# 			player_one = {:player_mode => Sequential.new, :marker => "X"}
# 		else
# 			puts "Invalid choice."
# 		end
# 	else
# 		puts "Invalid choice."
# 	end
# 	player_one
# end

# def player_two_mode(answer)
# 	if answer.downcase == "human"
# 		player_two = {:player_mode => Human.new, :marker => "O"}
# 		puts "Player two is O."
# 	elsif answer.downcase == "ai"
# 		puts "Would you like the AI to be simple or sequential?"
# 		answer = gets.chomp
# 		if answer.downcase == "simple"
# 			player_two = {:player_mode => Simple.new, :marker => "O"}
# 		elsif answer.downcase == "sequential"
# 			player_two = {:player_mode => Sequential.new, :marker => "O"}
# 		else
# 			puts "Invalid choice."
# 		end
# 	else
# 		puts "Invalid choice."
# 	end
# 	player_two
# end

# def display_board(board)
# 	puts """
# 	Game Board 
#  	 #{board[0]} | #{board[1]} | #{board[2]} 
# 	-----------
#  	 #{board[3]} | #{board[4]} | #{board[5]} 
# 	-----------
#  	 #{board[6]} | #{board[7]} | #{board[8]} 
#  	"""
# end

# choose_player_mode()