class Board

  def initialize(position)
    @grid = Array.new(8) {Array.new(8) {" "}}
    row, col = position
    @grid[row][col] = "K"
  end

  def render
    puts "  #{(0..7).to_a.join(" ")}"
    @grid.each_with_index do |row, idx|
      print "#{idx} "
      puts "#{row.join(" ")}"
    end
  end
end
