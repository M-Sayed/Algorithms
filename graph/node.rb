class Node
  attr_accessor :id, :children, :visited, :dfs_low, :dfs_num

  def initialize(id:, children: [])
    @id       = id
    @children = children
    @visited  = false
    @dfs_num  = 0
    @dfs_low  = 0
  end

  def visit!
    self.visited = true
  end

  def unvisit!
    self.visited = false
  end

  def visited?
    visited
  end
end
