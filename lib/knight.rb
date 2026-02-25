# frozen_string_literal: true

# Knight class representing the chess figure.
# Computes the shortest path of valid moves from one position to another.
class Knight
  def knight_moves(start, goal)
    path = shortest_path(start, goal)
    puts "You made it in #{path.length} moves! Here's your path:"
    print path
  end

  def shortest_path(start, goal)
    nil if out_of_bounds?(start)

    queue = [start]
    visited = [start]
    path = {}
    result = []

    until queue.empty?
      current = queue.shift
      break if current == goal

      valid_moves(current).each do |pos|
        next if visited.include?(pos)

        queue << pos
        visited << pos
        path[pos] = current
      end
    end
    current = goal
    until current == start
      result << current
      current = path[current]
    end
    result << start
    result.reverse
  end

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
