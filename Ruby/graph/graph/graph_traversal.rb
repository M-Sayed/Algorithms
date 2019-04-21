module Graph
  class GraphTraversal
    class << self
      def find_path(method, parent)
        @moves = []
        send(method, parent)
        @moves
      end

      private

      def dfs(parent)
        @moves << parent

        parent.visit!

        parent.children.each do |child|
          dfs(child) unless child.visited?
        end
      end

      def bfs(start)
        queue = [start]
        start.visit!

        while !queue.empty? do
          parent = queue.shift
          @moves << parent

          parent.children.each do |child|
            unless child.visited?
              queue.push(child)
              child.visit!
            end
          end
        end
      end
    end
  end
end
