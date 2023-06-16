require './Linked_List'
require './Node'

list = LinkedList.new

list.append(Node.new('Hazel'))
list.append(Node.new('Iona'))
list.append(Node.new('Pippa'))

puts list.to_s
list.pop
#list.pop
#list.pop
puts list.to_s
