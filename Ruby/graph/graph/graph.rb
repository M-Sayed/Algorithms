module Graph
  class Graph
    attr_accessor :nodes, :edges

    def initialize(nodes: [], edges: [])
      @nodes = nodes
      @edges = edges

      connect_nodes
    end

    def add_edge(edge)
      if !nodes.include?(edge.from) || !nodes.include?(edge.to)
        raise "either one or both of the nodes don't belong to this graph"
      end

      edge.from.children << edge.to
      edge.to.children << edge.from unless edge.directed?
    end

    def reset!
      self.nodes.each(&:unvisit!)
    end

    private

    def connect_nodes
      edges.each { |edge| add_edge(edge) }
    end
  end
end
