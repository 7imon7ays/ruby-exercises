puts "Which file do you want to open?"
file_name = gets.chomp
shuffled_lines = File.readlines(file_name).shuffle
p shuffled_lines
File.open("#{file_name}-shuffled.txt", "w") do |f|
  shuffled_lines.each do |line|
    f.puts line
  end
end