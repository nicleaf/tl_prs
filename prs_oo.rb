# noun: game, player, hand
# verb: choose, compare, 

class Hand
  #compare
end

class Player < Hand
  attr_accessor :name, :choice

  def initialize(name)
    @name = name
  end
  #choose
  def choose_hand
    begin
      puts "Choose p/r/s"
      player_choice = gets.chomp.downcase
    end until (player_choice == 'p') || (player_choice == 'r') || (player_choice == 's')
    self.choice = player_choice
  end

  def choose_hand_auto
    self.choice = Game::CHOICES.keys.sample    
  end

  def to_s
    "#{name} choose #{choice}"
  end

end

class Game
  CHOICES = {"p" => "PAPER", "r" => "ROCK", "s" => "SCISSOR"}
  
  attr_reader :player, :computer

  def initialize
    puts "Enter your name?"
    player_name = gets.chomp
    @player = Player.new(player_name)
    @computer = Player.new("Chris_aka_bot")
  end

  def play
    loop do
      player.choose_hand
      computer.choose_hand_auto
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

  def display_result(str)
    puts "-------------------"
    if str == "Tie"
      puts "#{player.name}, too bad, it's a #{str}!!!"
    else
      puts "#{str} won!!!"
    end
    puts "-------------------"
  end

  def self.display_welcome_start_game_message
    puts "Welcome to Paper - Rock - Scissor game!"
    puts "Start game!"
  end
end

Game.display_welcome_start_game_message
game = Game.new.play