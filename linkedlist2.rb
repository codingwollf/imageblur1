class LinkedListNode
  attr_accessor :value, :next_node

  def initialize(value, next_node=nil)
    @value = value
    @next_node = next_node
  end
end

class Stack # conventions in a stack include push and pop
  attr_reader :top

  def initialize
    @top = nil
  end

  def push(value)
    @top = LinkedListNode.new(value, @top)
  end

    # Pop an item off the stack.
    # Remove the last item that was pushed onto the
    # stack and return the value to the user
  def pop
    return print "no more :(" if @top.nil?
    print "#{@top.value}"
    @top = @top.next_node # reassign the second lego (aka, next node) as the new top
  end

end

def reverse_list(list)
  dogtower = Stack.new #dogtower will be the stored values for the for stack
  while list
    dogtower.push(list.value)
    list = list.next_node
  end

  return dogtower.top
end

def reverse_list!(list, previous=nil)
	while list
		 next_node = list.next_node
		 list.next_node = previous #change the next node property to the previous node
		 previous = list
		 list = next_node 
	end

	return previous
end

def print_values(list_node)
  if list_node
    print "#{list_node.value} --> "
    print_values(list_node.next_node) # next node becomes new top - looking at values of original top lego from list and push them into a new instance of node & stack
  else
    print "no more :("
    return
  end
end

node1 = LinkedListNode.new('dog')
node2 = LinkedListNode.new('wolf', node1)
node3 = LinkedListNode.new('fox', node2)

print_values(node3)
puts "
----flip it!-----"
revlist = reverse_list!(node3)
print_values(revlist)