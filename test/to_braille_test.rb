require_relative 'test_helper'

class ToBrailleTest < Minitest::Test
  def setup
    @translator = ToBraille.new("hello world")
    @translator2 = ToBraille.new("hello world. this is a longer string in order to test that my splitting into a max of forty characters works")
  end

  def test_it_exists
    assert_instance_of ToBraille, @translator
    assert_instance_of ToBraille, @translator2
  end

  def test_it_has_attributes
    assert_equal ["h","e","l","l","o"," ","w","o","r","l","d"], @translator.message
    assert_equal [], @translator.complete_message
  end

  def test_translate_message
    @translator2.translate_message

    assert_equal 9, @translator2.complete_message.count
  end

  def test_character_limit
    assert_equal 3, @translator2.character_limit[:top].count
    assert_equal 3, @translator2.character_limit[:middle].count
    assert_equal 3, @translator2.character_limit[:bottom].count
  end

  def test_translate
    expected = ["0.00..", "0..0..", "0.0.0.", "0.0.0.", "0..00.", "......", ".000.0", "0..00.", "0.000.", "0.0.0.", "00.0.."]

    assert_equal expected, @translator.translate
  end

  def test_format
    expected = {:top=>["0.", "0.", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", "00"],
      :middle=>["00", ".0", "0.", "0.", ".0", "..", "00", ".0", "00", "0.", ".0"],
      :bottom=>["..", "..", "0.", "0.", "0.", "..", ".0", "0.", "0.", "0.", ".."]}

    assert_equal expected, @translator.format
  end

  def test_to_braille
    assert_equal "0...0.", @translator.to_braille("k")
  end
end
