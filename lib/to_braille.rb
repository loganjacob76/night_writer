class ToBraille
  attr_reader :message

  def initialize(message)
    @message = message.downcase.split("")
  end
end
