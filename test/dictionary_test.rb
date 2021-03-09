require_relative 'test_helper'

class DictionaryTest < Minitest::Test
  def setup
    @dictionary = Dictionary.new
  end

  def test_it_exists
    assert_instance_of Dictionary, @dictionary
  end

  def test_it_has_attributes
    expected = {
      "a" => "0.....",
      "b" => "0.0...",
      "c" => "00....",
      "d" => "00.0..",
      "e" => "0..0..",
      "f" => "000...",
      "g" => "0000..",
      "h" => "0.00..",
      "i" => ".00...",
      "j" => ".000..",
      "k" => "0...0.",
      "l" => "0.0.0.",
      "m" => "00..0.",
      "n" => "00.00.",
      "o" => "0..00.",
      "p" => "000.0.",
      "q" => "00000.",
      "r" => "0.000.",
      "s" => ".00.0.",
      "t" => ".0000.",
      "u" => "0...00",
      "v" => "0.0.00",
      "w" => ".000.0",
      "x" => "00..00",
      "y" => "00.000",
      "z" => "0..000",
      " " => "......",
      "," => "..0...",
      "'" => "....0.",
      "." => "..00.0"
    }

    assert_equal expected, @dictionary.alphabet
  end

  def test_to_braille
    assert_equal "0...0.", @dictionary.to_braille("k")
  end

  def test_to_english
    assert_equal "f", @dictionary.to_english("000...")
  end
end