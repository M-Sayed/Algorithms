# Graph
> it's still being implemented, and not 100% covered by test yet.

under this module you can find the following classes:

## 1- Node
`Node` class helps you build your nodes, giving the node `id` and its `children` (optional).

```Ruby
node1 = Graph::Node.new(id: 1)
node2 = Graph::Node.new(id: 2)

node = Graph::Node.new(id: 3, children: [node1, node2])
```

## 2- Edge
`Edge` class helps you build your edges, giving the `from` and `to` nodes.

```Ruby
from = Graph::Node.new(id: 1)
to   = Graph::Node.new(id: 2)

edge = Graph::Edge.new(from: from, to: to)
```

edges by default are undirected, you can use `directed` args to make it directed.

```Ruby
edge = Graph::Edge.new(from: from, to: to, directed: true)
```

numeric cost is supported, you can set the edge cost by `cost` args.
default cost is `0`

```Ruby
edge = Graph::Edge.new(from: from, to: to, cost: 12)
```

## 3- Graph
`Graph` class helps you build your graph, with defined nodes and edges.

```Ruby
graph = Graph::Graph.new(nodes: nodes, edges: edges)
```

## 4- GraphTraversal
`GraphTraversal` class exposes only `find_path` method, that takes two arguments:

`method`: symbol that defines the desired algorithm, either `bfs` or `dfs`.
`parent`: symbol that defines the start node.

```Ruby
path = Graph::GraphTraversal.find_path(:bfs, node)
```

## 5- SCC
`SCC` class helps you get the strongly connected components of the given graph.

```Ruby
ss_components = Graph::SCC.new(graph).components
```
