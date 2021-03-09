require_relative 'to_braille'

class NightWriter
  files = ARGV
  input_file = File.read("./lib/#{files[0]}")
  text = input_file.downcase.gsub("\n", " ").strip
  puts "Created #{files[1]} containing #{text.length} characters"

  translator = ToBraille.new(text)
  translator.translate_message
  message = translator.complete_message

  new_file = File.new("./lib/#{files[1]}", "w")
  message.each do |line|
    new_file.puts(line)
  end
  new_file.close
end
