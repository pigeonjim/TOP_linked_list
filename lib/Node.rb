class Node
  attr_accessor :data, :pointer

  def initialize(data = nil)
    @data = data
    @pointer = nil
  end
end
