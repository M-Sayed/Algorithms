require_relative '../graph'

RSpec.describe "Strongly Connected Components" do
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
      Graph::Edge.new(from: @nodes[0], to: @nodes[1], directed: true),
      Graph::Edge.new(from: @nodes[1], to: @nodes[3], directed: true),
      Graph::Edge.new(from: @nodes[3], to: @nodes[2], directed: true),
      Graph::Edge.new(from: @nodes[2], to: @nodes[1], directed: true),
      Graph::Edge.new(from: @nodes[3], to: @nodes[4], directed: true),
      Graph::Edge.new(from: @nodes[4], to: @nodes[5], directed: true),
      Graph::Edge.new(from: @nodes[5], to: @nodes[7], directed: true),
      Graph::Edge.new(from: @nodes[7], to: @nodes[6], directed: true),
      Graph::Edge.new(from: @nodes[6], to: @nodes[4], directed: true)
    ]

    @graph = Graph::Graph.new(nodes: @nodes, edges: @edges)
  end

  it 'works find' do
    expect(Graph::SCC.new(@graph).components.map { |c| c.map(&:id) })
      .to eq([[6, 7, 5, 4], [2, 3, 1], [0]])
  end
end
