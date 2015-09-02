# noun: game, player
# verb: choose, compare, 

class Player
  attr_accessor :choice
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Human < Player
  def choose_hand
    begin
      puts "Choose p/r/s"
      player_choice = gets.chomp.downcase
    end until (player_choice == 'p') || (player_choice == 'r') || (player_choice == 's')
    self.choice = Game::CHOICES[player_choice]
    puts "-------------------"
    puts "#{name} choose #{choice}"
  end
end

class Computer < Player
  def choose_hand
    self.choice = Game::CHOICES.keys.sample    
    puts "-------------------"
    puts "#{name} choose #{Game::CHOICES[choice]}"
  end
end

class Game
  CHOICES = {"p" => "PAPER", "r" => "ROCK", "s" => "SCISSOR"}
  
  attr_reader :player, :computer

  def initialize
    display_welcome_start_game_message
    puts "Enter your name: "
    player_name = gets.chomp
    @player = Human.new(player_name)
    @computer = Computer.new("Chris_aka_bot")
  end

  def play
    loop do
      player.choose_hand
      computer.choose_hand
      compare_hand
      puts "Type 'y' to replay again."
      break if gets.chomp.downcase != 'y'
    end
    puts "#{player.name}, tata!"
  end

  def compare_hand
    if player.choice == computer.choice
      display_result("Tie")
    elsif (player.choice == "p" && computer.choice == "r") || 
      (player.choice == "r" && computer.choice == "s") || 
      (player.choice == "s" && computer.choice == "p")
      display_result(player.name)
    else
      display_result(computer.name)
    end      
  end

  def display_result(name)
    puts "\n----- RESULT ------"
    if name == "Tie"
      puts "#{player.name}, too bad, it's a #{name}!!!"
    else
      puts "#{name} won!!!"
    end
    puts "-------------------"
  end

  def display_welcome_start_game_message
    puts "Welcome to Paper - Rock - Scissor game!"
    puts "Start game!"
  end
end

Game.new.play