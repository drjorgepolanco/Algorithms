class Stack
  def initialize(array)
    @array = array
  end

  def push(new_item)
    @array.push(new_item)
  end

  def pop
    @array.pop
  end

  def peek
    @array.last
  end
end

@ary = Stack.new([2, 4, 5, 3, 5, 8, 12, 23])