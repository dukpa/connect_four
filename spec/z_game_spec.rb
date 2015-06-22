require './lib/game'

describe "Game"  do
  let(:game) { Game.new }
  subject { game }
  before { game.start }
  
  it { is_expected.to be_game_over }
end