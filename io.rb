def guessing_game
  secret_number = computer_choice
  chosen_number = user_choice
  until chosen_number == secret_number
    if chosen_number > secret_number
      puts "too big"
      chosen_number = user_choice
    elsif chosen_number < secret_number
      puts "too small"
      chosen_number = user_choice
    end
  end
  puts "you win"
  self
end

def computer_choice
  1 + rand(100)
end

def user_choice
  puts "choose a number between 1 and 100"
  number = gets.chomp.to_i
  while number == 0
    puts "invalid input. choose a number between 1 and 100"
    number = gets.chomp.to_i
  end
  number
end