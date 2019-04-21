require_relative '../graph'

RSpec.describe Graph::Node do
  let!(:node) do
    Graph::Node.new(id: 1, children: [
      Graph::Node.new(id: 2),
      Graph::Node.new(id: 3)
    ])
  end

  describe "Attributes" do
    it "responds to id" do
      expect(node).to respond_to(:id)
    end
    it "responds to children" do
      expect(node).to respond_to(:children)
    end
  end
end
