class ToBraille
  attr_reader :message,
              :dictionary,
              :complete_message

  def initialize(message)
    @message = message.downcase.split("")
    @dictionary = Dictionary.new
    @complete_message = []
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
      @dictionary.to_braille(letter)
    end
  end
end
