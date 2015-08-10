# Check README.md for pseudo code

require 'pry'

def display_result(who, choice)
  puts "#{who} won!"
  if choice == 'PAPER'
    puts "#{choice} wrapped ROCK!"
  elsif choice == 'ROCK'
    puts "#{choice} smashes SCISSOR!"
  else
    puts "#{choice} cut PAPER!"
  end
end

puts "Welcome to Paper - Rock - Scissor game!"
hsh = {"p" => "PAPER", "r" => "ROCK", "s" => "SCISSOR"}
 
loop do
  puts "Start? (y/n)"
  answer = gets.chomp
  if answer.downcase == 'y'
    begin
      puts "Choose p/r/s"
      player_choice = gets.chomp.downcase
    end until (player_choice == 'p') || (player_choice == 'r') || (player_choice == 's')
    computer_choice = hsh.keys.sample
    
    if player_choice == computer_choice
      puts "Tie!"
    elsif (player_choice == "p" && computer_choice == "r") || (player_choice == "r" && computer_choice == "s") || (player_choice == "s" && computer_choice == "p")
      display_result("You", hsh[player_choice])
    else
      display_result("Computer", hsh[computer_choice])
    end
    
    puts "Replay again? (y/n)"
    replay_choice = gets.chomp
    if replay_choice == 'y'
      next
    elsif replay_choice == 'n'
      break
    end
  elsif answer.downcase == 'n'
    break
  end
  puts "Replay again? (y/n)"
  replay_choice = get.chomp
end
puts "Tata!"