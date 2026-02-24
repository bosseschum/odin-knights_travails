# frozen_string_literal: true

# Knight class representing the chess figure.
# Computes the shortest path of valid moves from one position to another.
class Knight
  def out_of_bounds?(position)
    x, y = position
    x > 7 || y > 7 || x.negative? || y.negative?
  end

  def valid_moves(position)
    return if out_of_bounds?(position)

    x, y = position
    offset = [[2, 1], [2, -1], [1, 2], [1, -2], [-2, 1], [-2, -1], [-1, 2], [-1, -2]]

    offset.map { |dx, dy| [x + dx, y + dy] }.reject { |pos| out_of_bounds?(pos) }
  end
end
