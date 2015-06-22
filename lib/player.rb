class Player
  def initialize
  end

  def get_input
    begin
      input = Integer($stdin.gets.chomp)
    rescue ArgumentError => e
      nil
    rescue Interrupt => i
      puts "\nExiting..."
      abort
    else
      input.to_i
    end
  end
end