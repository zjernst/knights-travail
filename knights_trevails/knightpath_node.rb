require 'byebug'
require_relative 'polytree_node'

class KnightPathNode < PolyTreeNode
  DELTAS = [
    [2,1],
    [2,-1],
    [1,2],
    [1,-2],
    [-1,2],
    [-1, -2],
    [-2, 1],
    [-2, -1]
  ]

  def extend_node(visited_positions)

    next_positions = []

    DELTAS.each do |x, y|
      next_positions << [@value[0] + x, @value[1] + y]
    end

    next_positions.reject! do |position|
      position.any? { |coord| coord < 0 || coord > 7 } ||
        visited_positions.include?(position)
    end

    next_positions.each do |position|
      new_child = KnightPathNode.new(position)
      add_child(new_child)
      visited_positions << new_child.value
    end

    next_positions
  end
end
