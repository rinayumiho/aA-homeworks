require 'set'

class GraphNode
    attr_accessor :val, :neighbors

    def initialize(val, neighbors = nil)
        @val = val
        @neighbors = neighbors.nil? ? [] : neighbors
    end
end

def bfs(starting_node, target_value)
    visited = Set.new
    arr = [starting_node]
    visited << starting_node
    while !arr.empty?
        cur_node = arr.shift
        return cur_node if cur_node.val == target_value
        cur_node.neighbors.each do |child|
            next if visited.include?(child)
            visited << child
            arr << child
        end
    end
    nil
end

if $PROGRAM_NAME == __FILE__
    a = GraphNode.new('a')
    b = GraphNode.new('b')
    c = GraphNode.new('c')
    d = GraphNode.new('d')
    e = GraphNode.new('e')
    f = GraphNode.new('f')
    a.neighbors = [b, c, e]
    c.neighbors = [b, d]
    e.neighbors = [a]
    f.neighbors = [e]
    puts "try to find node with value b"
    p bfs(a, "b")
    puts "try to find node with value f"
    p bfs(a, "f")
end