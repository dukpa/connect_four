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
        ret = [i, pos]
        break
      end
    end if pos.between?(0, 7)

    ret
  end

  def match?
    col_match? || row_match? || diagonal_match?
  end

  private

  def row_match?(board=@board)
    count = 0
    last_cell = nil

    board.each do |row|
      row.each do |cell|
        count = (last_cell == cell && !cell.nil?) ? count + 1 : 1
        break if count == 4
        last_cell = cell
      end

      break if count == 4
      count = 0
    end

    count == 4
  end

  def col_match?
    columns = (1..7).map { |col| extract_col(col) }
    row_match?(columns)
  end

  def diagonal_match?
    bottom_cells = @board[0]
    left_cells = extract_col(0)
    
    bottom_diagonals = bottom_cells.each_index.map do |col|
      extract_diagonal(0, col)
    end

    left_diagonals = left_cells.each_index.map do |row|
      extract_diagonal(row, 0)
    end

    diagonals = bottom_diagonals + left_diagonals

    row_match?(diagonals)
  end

  def extract_col(col)
    @board.map { |row| row[col] }
  end

  def extract_diagonal(row, col)
    diagonal = []

    until @board[row].nil?
      diagonal << board[row][col]
      row += 1
      col += 1
    end

    diagonal
  end
end