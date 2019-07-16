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

  def breadth_first_search(target_value)
    queue = [@root]
    until queue.empty?
      node = queue.shift
      return node if node.value == target_value
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
    end
    nil
  end

  def depth_first_search(target_value)
    stack = [@root]
    until stack.empty?
      node = stack.pop
      return node if node.value == target_value
      stack << node.right unless node.right.nil?
      stack << node.left unless node.left.nil?  
    end
    nil
  end
  

  def dfs_rec(node = @root,target_value)
    return nil if node.empty?
    return node if node.value == target_value
    dfs_rec(node.left, target_value) unless node.left.nil?
    dfs_rec(node.right, target_value) unless node.right.nil?
  end
end