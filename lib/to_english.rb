class ToEnglish
  attr_reader :message,
              :dictionary,
              :complete_message

  def initialize(message)
    @message = message
    @dictionary = Dictionary.new
    @complete_message = ""
  end

  def form_letters
    rows = make_rows
    letters = []
    until rows[:top].empty?
      single_letter = [].join
      single_letter << rows[:top].slice!(0..1)
      single_letter << rows[:middle].slice!(0..1)
      single_letter << rows[:bottom].slice!(0..1)
      letters << single_letter
    end
    letters
  end

  def make_rows
    raw_text = @message
    rows = {
      top: [].join,
      middle: [].join,
      bottom: [].join
    }
    until raw_text.empty?
      rows[:top] << raw_text.shift
      rows[:middle] << raw_text.shift
      rows[:bottom] << raw_text.shift
    end
    rows
  end
end
