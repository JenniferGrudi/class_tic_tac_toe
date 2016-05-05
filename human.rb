# require_relative "board_logic.rb"

# class Human

# 	def get_move(board)
# 		array = get_available_spaces(board)
# 		display_board(board)
# 		puts "Choose a space from the following #{array}."
# 		answer = gets.chomp
# 		move = answer.to_i
# 		if move == board[move-1]
# 			move = answer.to_i
# 		else
# 			puts "Invalid Position."
# 		end
# 	end

# 	def display_board(board)
# 		puts """
# 		Game Board 
#  		 #{board[0]} | #{board[1]} | #{board[2]} 
# 		-----------
#  		 #{board[3]} | #{board[4]} | #{board[5]} 
# 		-----------
#  		 #{board[6]} | #{board[7]} | #{board[8]} 
#  		"""
# 	end			
# end	