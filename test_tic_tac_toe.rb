require "minitest/autorun"
require_relative "tic_tac_toe.rb"

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




end	