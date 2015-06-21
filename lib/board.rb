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
    match_in?(:row) || match_in?(:col) || match_in?(:diag)
  end

  def match_in?(direction)
    row_i = @last_move[0] - ((direction == :row) ? 0 : 3)
    col_i = @last_move[1] - ((direction == :col) ? 0 : 3)
    count = 0

    7.times do 
      count += 1 if !@board[row_i].nil? && @board[row_i][col_i]
      row_i += ((direction == :row) ? 0 : 1)
      col_i += ((direction == :col) ? 0 : 1)
    end

    count == 4
  end
end