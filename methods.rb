#require 'debugger'

def user_input
  puts "throw: rock, paper, or scissors?"
  user_play = gets.chomp
  until ["rock", "paper", "scissors"].include?(user_play)
    puts "invalid input" unless ["rock", "paper", "scissors"].include?(user_play)
    user_play = gets.chomp
  end
  user_play
end

def computer_choice
  computer_plays = ["rock", "paper", "scissors"]
  comp_play = computer_plays[rand(3)]
  comp_play
end

def rps
  computer_chose = computer_choice
  player_chose = user_input
  puts "Computer throws #{computer_chose}."
  puts playoff([player_chose, computer_chose])
end

def playoff(playoff_array)

  playoff_hash = {
    ["rock", "rock"] => "Draw!",
    ["rock", "paper"] => "You lose!",
    ["rock", "scissors"] => "You win!",

    ["paper", "rock"] => "You win!",
    ["paper", "paper"] => "Draw!",
    ["paper", "scissors"] => "You lose!",

    ["scissors", "rock"] => "You lose!",
    ["scissors", "paper"] => "You win!",
    ["scissors", "scissors"] => "Draw!"
  }

  playoff_hash[playoff_array]
end


def remix(ingredients)
  alcohols = []
  mixers = []
  ingredients.each do |mixer_arr|
    alcohols << mixer_arr[0]
    mixers << mixer_arr[1]
  end

  new_ingredients = []
  loop do
    alcohols.each do |alcohol|
      index = rand(3)
      pair = [alcohol, mixers[index]]
      new_ingredients << pair
    end
    break if new_ingredients.count > 2
  end
  new_ingredients
end

def bonus_remix(ingredients)
  alcohols = []
  mixers = []
  ingredients.each do |mixer_arr|
    alcohols << mixer_arr[0]
    mixers << mixer_arr[1]
  end

  new_ingredients = []
  random_offset = 1 + rand(2)
  alcohols.each_with_index do |alcohol, index|
    new_index = (random_offset + index) % 3
    pair = [alcohol, mixers[new_index]]
    new_ingredients << pair
  end
  new_ingredients
end






