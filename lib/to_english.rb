class ToEnglish
  attr_reader :message,
              :dictionary,
              :complete_message

  def initialize(message)
    @message = message
    @dictionary = Dictionary.new
    @complete_message = ""
  end
end
