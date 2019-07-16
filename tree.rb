class Node
  attr_reader :value
  attr_accessor :left, :right

  def initialize(value = nil)
    @value = value
    @left = nil;
    @right = nil
  end
end

class BinaryTree
  attr_accessor :root

  def initialize(root = nil)
    @root = root
  end

  def build_tree(array)
    @root = insert_node(nil, array.shift)
    array.each {|num| insert_node(@root, num) }
  end

  def insert_node(node, value)
    return Node.new(value) if node.nil?

    if value < node.value
      insert_node(node.left, value)
    elsif value > node.value
      insert_node(node.right, value)
    else
      return node
    end
  end
      
end