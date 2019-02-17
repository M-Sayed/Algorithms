class Edge
  attr_accessor :from, :to, :directed, :cost

  def initialize(from:, to:, directed: false, cost: 1)
    @from     = from
    @to       = to
    @directed = directed
    @cost     = cost
  end

  def directed?
    directed
  end
end
