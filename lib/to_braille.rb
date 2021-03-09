require_relative 'dictionary'

class ToBraille
  include Dictionary

  attr_reader :message,
              :complete_message

  def initialize(message)
    @message = message.downcase.split("")
    @complete_message = []
  end

  def translate_message
    lines = character_limit
    until lines[:top].empty?
      @complete_message << lines[:top].shift.join
      @complete_message << lines[:middle].shift.join
      @complete_message << lines[:bottom].shift.join
    end
  end

  def character_limit
    format.transform_values do |array|
      array.each_slice(40).to_a
    end
  end

  def format
    order = {
      top: [],
      middle: [],
      bottom: []
    }
    translate.each do |braille|
      order[:top] << braille[0..1]
      order[:middle] << braille[2..3]
      order[:bottom] << braille[4..5]
    end
    order
  end

  def translate
    @message.map do |letter|
      to_braille(letter)
    end
  end
end
