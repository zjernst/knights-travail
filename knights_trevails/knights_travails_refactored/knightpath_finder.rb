require_relative 'knightpath_node'

class KnightPathFinder
  def initialize(position)
    @position = position
    @tree = KnightPathNode.new(position)
    @leaves = [@tree]
    @visited_positions = [@position]
  end

  def extend_move_tree(visited_positions)
    @leaves.each do |leaf|
      leaf.send(:extend_node, visited_positions)
    end
    @leaves.map!(&:children).flatten!
  end

  def find_path(target)
    final_node = nil
    until final_node do
      extend_move_tree(@visited_positions)
      final_node = @tree.bfs(target)
    end
    p final_node.ancestors.map(&:value) << final_node.value
  end
end

if __FILE__ == $PROGRAM_NAME
  finder = KnightPathFinder.new([0,0])
  finder.find_path([3,2])
  finder.find_path([7,6])
  finder.find_path([6,2])
end
