require './lib/board'

describe "Board" do
  let(:board) { Board.new }

  context "while creating the grid" do
    let(:grid) { board.create_grid }
    let(:no_of_rows) { grid.length }
    let(:all_rows_of_7) { grid.all? { |row| row.length == 7 } }
    let(:all_rows_nil) { grid.all? { |row| row.all? { |cell| cell.nil? } } }
    
    it "has 6 rows" do
      expect(no_of_rows).to be 6
    end

    it "has 7 columns" do
      expect(all_rows_of_7).to be true
    end

    it "is empty" do
      expect(all_rows_nil).to be true
    end
  end

  context "while receiving a move" do
    before do
      7.times { board.move('W', 3) }
      board.move('W', 7)
    end
    
    it "places token at the bottom if empty" do
      expect(board.board[0][3]).to eq 'W'
    end

    it "places token at the next cell up if not empty" do
      expect(board.board[1][3]).to eq 'W'
    end

    it "does not place tokens on row 6" do
      expect(board.board[6]).to be_nil
    end

    it "does not place tokens on col 8" do
      expect(board.board[0][8]).to be_nil
    end
  end

  context "while a row matches" do
    let(:board) { Board.new }
    subject { board }

    before do
      board.move('W', 1)
      board.move('W', 2)
      board.move('W', 3)
      board.move('W', 4)
    end

    it { is_expected.to be_match }
  end

  context "while a column matches" do
    let(:board) { Board.new }
    subject { board }

    before do
      board.move('W', 1)
      board.move('W', 1)
      board.move('W', 1)
      board.move('W', 1)
    end

    it { is_expected.to be_match }
  end

  context "while a diagonal matches" do
    let(:board) { Board.new }
    subject { board }
    
    before do
      board.move('W', 1)

      board.move('B', 2)
      board.move('W', 2)

      board.move('B', 3)
      board.move('B', 3)
      board.move('W', 3)

      board.move('B', 4)
      board.move('B', 4)
      board.move('B', 4)
      board.move('W', 4)
    end

    it { is_expected.to be_match }
  end
end