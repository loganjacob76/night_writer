
class NightWriter
  files = ARGV
  input_file = File.read("./lib/#{files[0]}")
  text = input_file.downcase.gsub("\n", " ").strip



  new_file = File.new("./lib/#{files[1]}", "w")
  new_file.puts(text)
  new_file.close

  puts "Created #{files[1]} containing #{text.length} characters"
end
