require './lib/board'
require './lib/player'

class Game
  def initialize
    @player_w = Player.new
    @player_b = Player.new
    @board = Board.new
  end

  def start
    @current_player = @player_w
    take_turn
  end

  def take_turn
    print_board
    puts "\nIt is #{player_name}'s turn..."
    puts "Select a column 0 though 6..."

    until valid?(input ||= nil)
      input = @current_player.get_input
      puts "Enter a valid column." unless valid?(input)
    end

    @board.move(player_code, input)

    if game_over?
      print_board
      puts ""
      end_game
    else
      switch_player
      take_turn
    end
  end

  def game_over?
    @board.match? || @board.full?
  end

  def end_game
    if @board.match?
      puts "#{player_name} wins!"
    else
      puts "The game is a draw."
    end
  end

  def switch_player
    if @current_player == @player_w
      @current_player = @player_b
    else
      @current_player = @player_w
    end
  end

  def player_name
    if @current_player == @player_w
      "White"
    else
      "Black"
    end
  end

  def player_code
    if @current_player == @player_w
      "W"
    else
      "B"
    end
  end

  def valid?(input)
    input && input.between?(0, 6)
  end

  def print_board
    puts "The Board"
    puts "-----------------------------"
    puts "| 0 | 1 | 2 | 3 | 4 | 5 | 6 |"
    puts "|---|---|---|---|---|---|---|"

    @board.board.reverse.each do |row|
      print "|"

      row.each do |cell|
        if cell == 'W'
          print " \u26AA |"
        elsif cell == 'B'
          print " \u26AB |"
        else
          print " \u25CB |"
        end
      end

      puts ""
    end
  end
end