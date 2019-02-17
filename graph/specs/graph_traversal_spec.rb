require_relative '../graph_traversal'

RSpec.describe GraphTraversal do
  before :each do
    @nodes = [
      Node.new(id: 0),
      Node.new(id: 1),
      Node.new(id: 2),
      Node.new(id: 3),
      Node.new(id: 4),
      Node.new(id: 5),
      Node.new(id: 6),
      Node.new(id: 7)
    ]
    
    @edges = [
      Edge.new(from: @nodes[0], to: @nodes[1], directed: false),
      Edge.new(from: @nodes[1], to: @nodes[3], directed: false),
      Edge.new(from: @nodes[3], to: @nodes[2], directed: false),
      Edge.new(from: @nodes[2], to: @nodes[1], directed: false),
      Edge.new(from: @nodes[3], to: @nodes[4], directed: false),
      Edge.new(from: @nodes[4], to: @nodes[5], directed: false),
      Edge.new(from: @nodes[5], to: @nodes[7], directed: false),
      Edge.new(from: @nodes[7], to: @nodes[6], directed: false),
      Edge.new(from: @nodes[6], to: @nodes[4], directed: false)
    ]

    @graph = Graph.new(nodes: @nodes, edges: @edges)
  end

  it 'responds to find_path' do
    expect(GraphTraversal).to respond_to(:find_path)
  end

  describe "DFS" do
    it 'responds with right path' do
      path = []
      @nodes.each do |node|
        path << GraphTraversal.find_path(:dfs, node) unless node.visited?
      end

      expect(path.flatten.map(&:id)).to eq([0, 1, 3, 2, 4, 5, 7, 6])
    end
  end

  describe "BFS" do
    it 'responds with right path' do
      path = []
      @nodes.each do |node|
        path << GraphTraversal.find_path(:bfs, node) unless node.visited?
      end

      expect(path.flatten.map(&:id)).to eq([0, 1, 3, 2, 4, 5, 6, 7])
    end
  end
end
