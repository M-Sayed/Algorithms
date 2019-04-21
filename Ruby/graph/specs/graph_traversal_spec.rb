require_relative '../graph'

RSpec.describe Graph::GraphTraversal do
  before :each do
    @nodes = [
      Graph::Node.new(id: 0),
      Graph::Node.new(id: 1),
      Graph::Node.new(id: 2),
      Graph::Node.new(id: 3),
      Graph::Node.new(id: 4),
      Graph::Node.new(id: 5),
      Graph::Node.new(id: 6),
      Graph::Node.new(id: 7)
    ]

    @edges = [
      Graph::Edge.new(from: @nodes[0], to: @nodes[1], directed: false),
      Graph::Edge.new(from: @nodes[1], to: @nodes[3], directed: false),
      Graph::Edge.new(from: @nodes[3], to: @nodes[2], directed: false),
      Graph::Edge.new(from: @nodes[2], to: @nodes[1], directed: false),
      Graph::Edge.new(from: @nodes[3], to: @nodes[4], directed: false),
      Graph::Edge.new(from: @nodes[4], to: @nodes[5], directed: false),
      Graph::Edge.new(from: @nodes[5], to: @nodes[7], directed: false),
      Graph::Edge.new(from: @nodes[7], to: @nodes[6], directed: false),
      Graph::Edge.new(from: @nodes[6], to: @nodes[4], directed: false)
    ]

    @graph = Graph::Graph.new(nodes: @nodes, edges: @edges)
  end

  it 'responds to find_path' do
    expect(Graph::GraphTraversal).to respond_to(:find_path)
  end

  describe "DFS" do
    it 'responds with right path' do
      path = []
      @nodes.each do |node|
        path << Graph::GraphTraversal.find_path(:dfs, node) unless node.visited?
      end

      expect(path.flatten.map(&:id)).to eq([0, 1, 3, 2, 4, 5, 7, 6])
    end
  end

  describe "BFS" do
    it 'responds with right path' do
      path = []
      @nodes.each do |node|
        path << Graph::GraphTraversal.find_path(:bfs, node) unless node.visited?
      end

      expect(path.flatten.map(&:id)).to eq([0, 1, 3, 2, 4, 5, 6, 7])
    end
  end
end
