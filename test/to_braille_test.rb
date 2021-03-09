require_relative 'test_helper'

class ToBrailleTest < Minitest::Test
  def setup
    @translator = ToBraille.new("hello world")
  end

  def test_it_exists
    assert_instance_of ToBraille, @translator
  end
end
