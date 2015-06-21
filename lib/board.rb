class Board
  attr_reader :board

  def initialize
    @board = create_grid
  end

  def create_grid
    (1..6).map { (1..7).map { nil } }
  end

  def move(color, pos)
    ret = nil

    (0...@board.length).each do |i|
      if @board[i][pos].nil?
        @board[i][pos] = color
        @last_move = ret = [i, pos]
        break
      end
    end if pos.between?(0, 6)

    ret
  end

  def match?
    col_match? || row_match? || diag_match?
  end

  private

  def row_match?
    row_i = @last_move[0]
    col_i = @last_move[1] - 3
    count = 0

    7.times do 
      count += 1 if @board[row_i][col_i]
      col_i += 1
    end

    count == 4
  end

  def col_match?
    row_i = @last_move[0] - 3
    col_i = @last_move[1]
    count = 0

    7.times do 
      count += 1 if !@board[row_i].nil? && @board[row_i][col_i]
      row_i += 1
    end

    count == 4
  end

  def diag_match?
    row_i = @last_move[0] - 3
    col_i = @last_move[1] - 3
    count = 0

    7.times do 
      count += 1 if !@board[row_i].nil? && @board[row_i][col_i]
      row_i += 1
      col_i += 1
    end

    count == 4
  end
end