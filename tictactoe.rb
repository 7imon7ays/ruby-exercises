"

    A   B   C
  .___________.
1 |   |   |   |
  +---+---+---+
2 |   |   |   |
  +---+---+---+
3 |   |   |   |
  +---+---+---+

"
class TicTacToe

  def initialize
    @row1 = Array.new(3, nil)
    @row2 = Array.new(3, nil)
    @row3 = Array.new(3, nil)
    @grid = [@row1, @row2, @row3]
  end

  def render

    p @grid[0].map {|value| value.nil? ? "__" : value}
    p @grid[1].map {|value| value.nil? ? "__" : value}
    p @grid[2].map {|value| value.nil? ? "__" : value}
  end

  def place_pawn(row, col, player_mark)
    @grid[row][col] = player_mark
  end

  def player_move
    puts "Pick a row (0-2)"
    row_move = gets.chomp.to_i
    puts "pick a column (0-2)"
    col_move = gets.chomp.to_i
    place_pawn(row_move, col_move, 'x')
  end

  def comp_move
    # winning move
    if !find_winning_square(@grid).nil?
      puts "Computer wins! You're a loser."
      game_over? {return true}
      winning_move = find_winning_square(@grid)
      place_pawn(winning_move[0], winning_move[1], "o")
      render
    else
      comp_coordinates = []
      loop do # Generate positions until it finds an open square
        row_move = rand(3)
        col_move = rand(3)
        comp_coordinates = [row_move, col_move]
        break if @grid[row_move][col_move].nil?
      end
      puts "Computers plays on #{comp_coordinates}"
      place_pawn(comp_coordinates[0], comp_coordinates[1], "o")
    end
  end

  def game_over?
    @grid.each do |row|
      return true if row.count("x") > 2
    end

    transpose(@grid).each do |row|
      return true if row.count("x") > 2
    end

    left_diagonal = [@grid[0][0], @grid[1][1], @grid[2][2]]
    right_diagonal = [@grid[2][0], @grid[1][1], @grid[0][2]]

    if left_diagonal.count("x") > 2
      return true
    end
    if right_diagonal.count("x") > 2
      return true
    end

    false
  end


  def play_game
    loop do
      render
      puts "make your move, human"
      player_move
      if game_over?
        render
        puts "You win!"
        break
      end
      comp_move
    end
  end
  # FINDING WINNING SQUARES

  def find_winning_row(current_grid)
    current_grid.each_with_index do |row, row_index|
      pawn_counter = 0
      row.each do |col|
        pawn_counter += 1 if col == "o"
        return row_index if pawn_counter > 1
      end
    end
    nil
  end

  def find_winning_column(current_grid, row_index)
    return nil if row_index.nil?
    current_grid[row_index].each_with_index do |col, col_index|
      return col_index if col != "o"
    end
  end

  def find_diagonal_win
    left_diagonal = [@grid[0][0], @grid[1][1], @grid[2][2]]
    right_diagonal = [@grid[2][0], @grid[1][1], @grid[0][2]]

    if left_diagonal.count("o") == 2
      return [left_diagonal.index(nil), left_diagonal.index(nil)]
    end

    if right_diagonal.count("o") == 2
      return [(2 - right_diagonal.index(nil)).abs, right_diagonal.index(nil)]
    end
    nil
  end

  def transpose(ary)
    cols = ary.count
    rows = ary[0].count
    new_ary = []

    rows.times do |x|
      new_ary << []
      cols.times do
        new_ary[x] << nil
      end
    end

    rows.times do |y|
      cols.times do |z|
        new_ary[y][z] = ary[z][y]
      end
    end

    new_ary
  end

  def find_winning_square(current_grid)

    winning_row = find_winning_row(current_grid)
    winning_column = find_winning_column(current_grid, winning_row)

    transposed_grid = transpose(current_grid)
    transposed_winning_row = find_winning_row(transposed_grid)
    transposed_winning_column = find_winning_column(transposed_grid, transposed_winning_row)

    unless winning_row.nil?
      return [winning_row, winning_column]
    end
    unless transposed_winning_row.nil?
      return [transposed_winning_column, transposed_winning_row]
    end

    unless find_diagonal_win.nil?
      return find_diagonal_win
    end

    nil
  end

end

# situation = [[nil, nil, nil], [nil, "o", nil], ["o", nil, nil]]

game = TicTacToe.new

game.play_game