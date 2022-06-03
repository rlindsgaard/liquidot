require 'minitest/autorun'
require 'liquidot'

class LiquiDotTest < Minitest::Test
  def test_hello
    assert_equal "Hello world!",
      LiquiDot::hello_world
  end
end
