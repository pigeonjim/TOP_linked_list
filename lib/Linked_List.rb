class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = Node.new
    @tail = Node.new
  end

  def append(node)
    @head = node if @head.pointer.nil?
    @tail.pointer = node.object_id unless @head.pointer.nil?
    @head.pointer = node.object_id
    @tail = node
  end

  def prepend(node)
    node.pointer = @head.object_id unless @head.pointer.nil?
    @head = node
  end

  def size
    return 0 unless @head != 0
    node_address = @head.object_id
    size = 0
    until node_address.nil?
      size += 1
      node_address = ObjectSpace._id2ref(node_address).pointer
    end
    return size
  end
end
