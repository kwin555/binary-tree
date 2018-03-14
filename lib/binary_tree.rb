class BinaryTree
  attr_accessor :payload, :left, :right

  def initialize(payload, left, right)
    @payload = payload
    @left = left
    @right = right
  end
end

class BTreeSort
  def self.build(number_input)
    first_node = number_input[0]
    remainder_of_number_input = number_input.last(number_input.size - 1)
    trunk = BinaryTree.new(first_node, nil, nil)

    remainder_of_number_input.each do |value|
      queue = []
      queue.push(trunk)

      node = BinaryTree.new(value, nil, nil)
      until queue.empty?
        current_node = queue.shift

        if value < current_node.payload
          if current_node.left.nil?
            current_node.left = node
          else
            queue.push(current_node.left)
          end
        else
          if current_node.right.nil?
            current_node.right = node
          else
            queue.push(current_node.right)
          end
        end
      end
    end
    trunk
  end

    def self.in_order(node, sorted_array)

    return "Done" if node == nil 
        
    self.in_order(node.left, sorted_array)
    sorted_array << node.payload
    self.in_order(node.right, sorted_array)

    return sorted_array
  end

  def self.sort(array)
    trunk = self.build(array)
    sorted_array = []

    return self.in_order(trunk, sorted_array)
  end
end
