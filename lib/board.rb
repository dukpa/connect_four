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

  def full?
    @board.all? { |row| row.none? { |cell| cell.nil? } }
  end

  private
  
  def match_in?(direction)
    row_i = @last_move[0] - ((direction == :row) ? 0 : 3)
    col_i = @last_move[1] - ((direction == :col) ? 0 : 3)
    count = 0
    last_cell = nil

    7.times do
      current_cell = get_value_at(row_i, col_i)
      
      if current_cell == last_cell && !current_cell.nil?
        count += 1
        break if count == 3
      else
        count = 0
      end

      last_cell = current_cell
      row_i += ((direction == :row) ? 0 : 1)
      col_i += ((direction == :col) ? 0 : 1)
    end

    count == 3
  end

  def get_value_at(row_i, col_i)
    @board[row_i][col_i] unless @board[row_i].nil?
  end
end