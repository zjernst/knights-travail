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

  def find_next_positions
    next_positions = []

    DELTAS.each do |x, y|
      next_positions << [@value[0] + x, @value[1] + y]
    end
  end

  def off_board?(position)
    position.any? { |coord| coord < 0 || coord > 7 }
  end

  def add_child_from(position, visited_positions)
    new_child = KnightPathNode.new(position)
    add_child(new_child)
    visited_positions << new_child.value
  end

  def extend_node(visited_positions)

    next_positions = find_next_positions

    next_positions.reject! do |position|
      off_board?(position) || visited_positions.include?(position)
    end

    next_positions.each do |position|
      add_child_from(position, visited_positions)
    end

    next_positions
  end
end
