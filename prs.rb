# Check README.md for pseudo code

require 'pry'

def is_player_win(player,computer)
  (player == "p" && computer == "r") || (player == "r" && computer == "s") || (player == "s" && computer == "p")
end

def display_result(who, choice)
  puts "-------------------"
  puts "#{who} won!"
  if choice == 'PAPER'
    puts "#{choice} wrapped ROCK!"
  elsif choice == 'ROCK'
    puts "#{choice} smashes SCISSOR!"
  else
    puts "#{choice} cut PAPER!"
  end
  puts "-------------------"
end

puts "Welcome to Paper - Rock - Scissor game!"
puts "Start game!"
hsh = {"p" => "PAPER", "r" => "ROCK", "s" => "SCISSOR"}
 
loop do
  begin
    puts "Choose p/r/s"
    player_choice = gets.chomp.downcase
  end until (player_choice == 'p') || (player_choice == 'r') || (player_choice == 's')
  computer_choice = hsh.keys.sample
    
  if player_choice == computer_choice
    puts "-------------------"
    puts "Tie!"
    puts "-------------------"
  elsif is_player_win(player_choice,computer_choice)
    display_result("You", hsh[player_choice])
  else
    display_result("Computer", hsh[computer_choice])
  end

  puts "Type 'y' to replay again."
  break if gets.chomp.downcase != 'y'
end

puts "Tata!"