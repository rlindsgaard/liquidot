require 'minitest/autorun'
require 'liquidot'

class LiquiDotTest < Minitest::Test
  def test_format_plain_text
    assert_equal "Hello world!",
      LiquiDot::Template.parse_string("Hello world!").render()
  end

  def test_format_liquid_frontmatter
    assert_equal "Hello dave!",
      LiquiDot::Template.parse_string(
        "---\nname: dave\n---\nHello {{ name }}!",
      ).render()
  end

  def test_format_hellow_world
    expected = "digraph { hello -> dave }"
    assert_equal LiquiDot::Template.parse_string("---\nname: dave\n---\ndigraph { hello -> {{ name }} }").render(),
      expected
  end

  def test_parse_file
    assert_equal "digraph G {
  hello -> dave
}
",
      LiquiDot::Template.parse('examples/hello_world.dot').render()
  end

  def test_parse_file_override_arg
    assert_equal "digraph G {
  hello -> world
}
",
      LiquiDot::Template.parse('examples/hello_world.dot').render({"name" => 'world'})
  end
end
