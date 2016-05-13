class PolytreeNode
  attr_reader :value
  attr_accessor :parent, :children

  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
end
