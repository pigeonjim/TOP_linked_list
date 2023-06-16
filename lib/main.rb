require './Linked_List'
require './Node'

list = LinkedList.new

list.append(Node.new('james'))

list.append(Node.new('Pippa'))

puts list.size
