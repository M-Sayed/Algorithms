['../node', '../graph', '../SCC', '../edge'].each { |f| require_relative f }

RSpec.describe "Strongly Connected Components" do
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
      Edge.new(from: @nodes[0], to: @nodes[1], directed: true),
      Edge.new(from: @nodes[1], to: @nodes[3], directed: true),
      Edge.new(from: @nodes[3], to: @nodes[2], directed: true),
      Edge.new(from: @nodes[2], to: @nodes[1], directed: true),
      Edge.new(from: @nodes[3], to: @nodes[4], directed: true),
      Edge.new(from: @nodes[4], to: @nodes[5], directed: true),
      Edge.new(from: @nodes[5], to: @nodes[7], directed: true),
      Edge.new(from: @nodes[7], to: @nodes[6], directed: true),
      Edge.new(from: @nodes[6], to: @nodes[4], directed: true)
    ]

    @graph = Graph.new(nodes: @nodes, edges: @edges)
  end

  it 'works find' do
    expect(SCC.new(@graph).components.map { |c| c.map(&:id) })
      .to eq([[6, 7, 5, 4], [2, 3, 1], [0]])
  end
end
