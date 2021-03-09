class ToBraille
  attr_reader :message,
              :dictionary,
              :complete_message

  def initialize(message)
    @message = message.downcase.split("")
    @dictionary = Dictionary.new
    @complete_message = []
  end

  def translate
    @message.map do |letter|
      @dictionary.to_braille(letter)
    end
  end
end
