%w(graph node graph_traversal).each { |f| require_relative f }

class SCC
  attr_accessor :graph
  attr_reader   :components

  def initialize(graph)
    @turn  = 0
    @graph = graph
    @current_component_nodes = []
  end

  def components
    if @components.nil?
      @components = []
      graph.nodes.each do |node|
        strongly_connected_component(node) unless node.visited?
      end
    end

    @components
  end

  private

  attr_accessor :current_component_nodes

  def strongly_connected_component(parent)
    parent.visit!
    parent.dfs_num = parent.dfs_low = (@turn += 1)

    @current_component_nodes << parent

    parent.children.each do |child|
      strongly_connected_component(child) unless child.visited?

      parent.dfs_low = [parent.dfs_low, child.dfs_low].min if child.visited?

      if parent.dfs_low == parent.dfs_num # start of scc
        @components << component_of(parent)
      end
    end
  end

  def component_of(parent)
    component = []

    loop do
      component << (node = @current_component_nodes.pop)
      break if node == parent
    end

    component
  end
end
