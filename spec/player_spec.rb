require './lib/player'

describe "Player" do
  let(:player) { Player.new }
  
  context "while taking input" do
    subject { player.get_input }
    after { $stdin = STDIN }

    context "while taking valid input (1)" do
      before { $stdin = StringIO.new("1\n") }
        it { is_expected.to eq(1) }
    end

    context "while taking invalid input" do
      before { $stdin = StringIO.new("a\n") }
      it { is_expected.to be_nil }
    end
  end
end