class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) { [] }
    place_stones
    @name1 = name1
    @name2 = name2
    # @current_player = @name1
    # @current_points_cup_idx = 6
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    (0..13).each { |idx| 4.times { @cups[idx] << :stone } if idx != 6 && idx != 13 }
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos < 0 || start_pos > 13
    raise "Starting cup is empty" if @cups[start_pos].empty?
    true
  end

  def make_move(start_pos, current_player_name)
    step = @cups[start_pos].length
    i = start_pos
    @cups[start_pos] = []
    while step > 0
      i = (i + 1) % 14
      next if current_player_name == @name1 && i == 13 || current_player_name == @name2 && i == 6
      @cups[i] << :stone
      step -= 1
    end
    render
    return next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    return :switch if @cups[ending_cup_idx].length == 1
    ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    return true if @cups[0..5].all? { |ele| ele.empty? } || @cups[7..12].all? { |ele| ele.empty? }
    false
  end

  def winner
    return :draw if @cups[6].length == @cups[13].length
    return @name1 if @cups[6].length > @cups[13].length
    @name2
  end
end
