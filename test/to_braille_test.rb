require_relative 'test_helper'

class ToBrailleTest < Minitest::Test
  def setup
    @translator = ToBraille.new("hello world")
  end

  def test_it_exists
    assert_instance_of ToBraille, @translator
  end

  def test_it_has_attributes
    assert_equal ["h","e","l","l","o"," ","w","o","r","l","d"], @translator.message
    assert_instance_of Dictionary, @translator.dictionary
    assert_equal [], @translator.complete_message
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
end
