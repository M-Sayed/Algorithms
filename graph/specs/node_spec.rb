require_relative '../node'

RSpec.describe Node do
  let!(:node) do
    Node.new(id: 1, children: [
      Node.new(id: 2),
      Node.new(id: 3)
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
