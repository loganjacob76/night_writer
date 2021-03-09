require_relative 'dictionary'

class ToEnglish
  include Dictionary
  
  attr_reader :message,
              :complete_message

  def initialize(message)
    @message = message
    @complete_message = ""
  end

  def translate
    english = form_letters.map do |braille|
      to_english(braille)
    end.join
    @complete_message = english
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
