require_relative 'test_helper'

class ToEnglishTest < Minitest::Test
  def setup
    @message = [".00.0..0...000...0..0.0.00..0...000..0.00.000....00.0..0...00..0..0.0.0000..0.00",
 "0000..00..0.0...0...00...0.........00.0...00.0..0000..00..00..0...0..0.000...0.0",
 ".0....0.........................0...0.0.........0.....0....0..0...0.0.0.......0.",
 "0.0.000....00...000.0.00..000.0..0.0000.0...0..0000..0",
 ".0..0000..00.0..0..000........0.000.0.0..0..0.0..0.00.",
 "0.00......0.0.....0.0.0...0.000.0...0.0.....0...0...0."]

    @translator = ToEnglish.new(@message)
  end

  def test_it_exists
    assert_instance_of ToEnglish, @translator
  end

  def test_it_has_attributes
    assert_equal @message, @translator.message
    assert_instance_of Dictionary, @translator.dictionary
    assert_equal "", @translator.complete_message
  end
end
