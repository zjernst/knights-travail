class PolyTreeNode
  attr_reader :value, :ancestors, :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
    @ancestors = []
  end

  def parent=(node)
    parent.children.delete(self) if parent
    @parent = node
    @ancestors = node.ancestors + [node]
    node.children << self unless node.nil?
  end

  def add_child(node)
    node.parent = self
  end

  def remove_child(node)
    raise unless children.include?(node)
    node.parent = nil
  end

  def dfs(target_value)
    return self if self.value == target_value

    children.each do |child|
      target_node = child.dfs(target_value)
      return target_node unless target_node.nil?
    end

    nil
  end

  def bfs(target_value)
    queue = [self]

    until queue.empty? do
      return queue.shift if queue.first.value == target_value
      queue.concat(queue.shift.children)
    end

    nil
  end
end
