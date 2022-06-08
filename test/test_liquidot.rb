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

  def test_format_hellow_word
    expected = "digraph { hello -> dave }"
    assert_equal LiquiDot::format("---\nname: dave\n---\ndigraph { hello -> {{ name }} }"),
      expected
  end

  def test_parse_file
    assert_equal "digraph G {
  hello -> dave
}
",
      LiquiDot::format(File.read('examples/hello_world.dot'))
  end
end
