require 'minitest/autorun'
require 'liquidot'

class LiquiDotTest < Minitest::Test
  def test_format_plain_text
    assert_equal "Hello world!",
      LiquiDot::format("Hello world!")
  end

  def test_format_liquid_frontmatter
    assert_equal "Hello dave!",
      LiquiDot::format(
        "---\nname: dave\n---\nHello {{ name }}!",
      )
  end
end
