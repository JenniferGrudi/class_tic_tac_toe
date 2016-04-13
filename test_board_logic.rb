require "minitest/autorun"
require_relative "board_logic.rb"

class TestTicTacToe <Minitest::Test

	def test_board_array
		assert_equal([1, 2, 3, 4, 5, 6, 7, 8, 9], create_new_board)
	end	

	def test_board_position_update
		assert_equal([1, 2, 3, 4, "X", 6, 7, 8, 9], update_board([1, 2, 3, 4, 5, 6, 7, 8, 9], 4, "X"))
		assert_equal(["X", 2, 3, 4, 5, 6, 7, 8, 9], update_board([1, 2, 3, 4, 5, 6, 7, 8, 9], 0, "X"))
		assert_equal([1, 2, 3, 4, 5, "O", 7, 8, 9], update_board([1, 2, 3, 4, 5, 6, 7, 8, 9], 5, "O"))
		assert_equal([1, 2, 3, 4, 5, "O", 7, 8, 9], update_board([1, 2, 3, 4, 5, "X", 7, 8, 9], 5, "O"))
	end

 	def test_position_is_valid
 		assert_equal(false, validating_position?([1, 2, 3, 4, 5, "X", 7, 8, 9], 5, "X"))
	end

	def test_winning_game
		assert_equal(true, winner?(["X", "X", "X", 4, 5, 6, 7, 8, 9], "X"))
		assert_equal(true, winner?(["X", 2, 3, 4, "X", 6, 7, 8, "X"], "X"))
		assert_equal(true, winner?([1, 2, 3, 4, 5, 6, "O", "O", "O"], "O"))
		assert_equal(false, winner?([1, "O", 3, "O", 5, 6, "O", 8, 9], "O"))
	end	

	def test_cats_game
		assert_equal(true, cats_game?(["X", "X", "O", "O", "X", "X", "X", "O", "O"]))
		assert_equal(false, cats_game?(["X", 2, 3, 4, "X", 6, 7, 8, "X"]))
	end		

	def test_game_is_over
	 	assert_equal(true, game_over?([1,2, "X",4,5,"X", 7,8, "X"], "X"))
	 	assert_equal(true, game_over?(["O", "X", "X", "O", "O", "X", "X", "O", "X"], "X"))
	 	
	end

	def test_available_spaces
		assert_equal([1, 2, 3], get_available_spaces([1, 2, 3, "O", "O", "X", "X", "O", "X"]))
		assert_equal([4, 5, 6], get_available_spaces(["O", "X", "X",4 ,5,6,"X", "O", "X"]))
	end



end	