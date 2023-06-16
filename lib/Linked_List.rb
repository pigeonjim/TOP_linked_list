class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(node)
    if @head.nil?
      @head = node
      return
    elsif @tail.nil?
      @head.pointer = node.object_id
    else
      @tail.pointer = node.object_id
    end
    @tail = node
  end

  def prepend(node)
    if @head.nil?
      @head = node
      return
    elsif @tail.nil?
      @tail = @head
    end
    node.pointer = @head.object_id
    @head = node
  end

  def size
    return 0 if head.nil?
    return 1 if head.pointer.nil?

    node_address = @head.object_id
    size = 0
    until node_address.nil?
      size += 1
      node_address = ObjectSpace._id2ref(node_address).pointer
    end
    return size
  end

  def at_index(idx)
    return Node.new if @head.nil?
    return @head if @head.pointer.nil?

    node_address = @head.object_id
    counter = 0
    until counter == idx
      counter += 1
      node_address = ObjectSpace._id2ref(node_address).pointer
    end
    return ObjectSpace._id2ref(node_address)
  end

  def pop
    return if head.nil?

    if @head.pointer.nil?
      @head = nil
    elsif size > 2
      @tail = at_index(size - 2)
      @tail.pointer = nil
    else
      @head.pointer = nil
      @tail = nil
    end
  end

  def to_s
    return '' if head.nil?
    return "#{@head.data}" if head.pointer.nil?

    node_address = @head.object_id
    str = ''
    until node_address.nil?
      str = "#{str} - #{ObjectSpace._id2ref(node_address).data}"
      node_address = ObjectSpace._id2ref(node_address).pointer
    end
    return str
  end
end
