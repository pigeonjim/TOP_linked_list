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
    return 0 if @head.nil?
    return 1 if @head.pointer.nil?

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
    return if @head.nil?

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
    return '' if @head.nil?
    return @head.data.to_s if head.pointer.nil?

    node_address = @head.object_id
    str = ''
    until node_address.nil?
      str = "#{str} - #{ObjectSpace._id2ref(node_address).data}"
      node_address = ObjectSpace._id2ref(node_address).pointer
    end
    return str
  end

  def include?(value)
    return false if @head.nil? || @head.data.nil?
    return true if @head.pointer.nil? && @head.data.include?(value)

    node_address = @head.pointer
    until node_address.nil?
      return true if ObjectSpace._id2ref(node_address).data.include?(value)

      node_address = ObjectSpace._id2ref(node_address).pointer
    end
    return false
  end

  def find(value)
    return nil if @head.nil? || @head.data.nil?

    node_address = @head.object_id
    counter = 0
    until node_address.nil?
      return counter if ObjectSpace._id2ref(node_address).data.include?(value)

      node_address = ObjectSpace._id2ref(node_address).pointer
      counter += 1
    end
    return nil
  end

  def insert_at(value, index)
    return if index < 0
    if @head.nil? || index == 0
      prepend(Node.new(value)) 
      return
    elsif index > size - 1
      append(Node.new(value))
    else
      the_insert
    end
  end

  def the_insert(value, index)
    node_address = at_index(index).object_id
    node_before = at_index(index - 1)
    node_before.pointer = Node.new(value).object_id
    at_index(index).pointer = node_address
  end
end
