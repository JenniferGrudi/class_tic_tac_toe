require "minitest/autorun"
require_relative "Simple.rb"

class TestRubbish <Minitest::Test

	def test_first_available_space
		assert_equal(1, get_move([1,2,3,4,5,6,7,8,9]))
		assert_equal(5, get_move(["O", "X", "O", "X", 5, "X", "X", "O", "O"]))
	end	
end	
