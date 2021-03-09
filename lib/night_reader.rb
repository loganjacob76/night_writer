require_relative 'to_english'

class NightReader
  files = ARGV
  input_file = File.read("./lib/#{files[0]}")
  text = input_file.split("\n")
  puts "Created #{files[1]} containing #{text.join.length / 6} characters"

  translator = ToEnglish.new(text)
  translator.translate

  new_file = File.new("./lib/#{files[1]}", "w")
  new_file.puts(translator.complete_message)
  new_file.close
end
