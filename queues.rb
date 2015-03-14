class Queue
  def initialize(array)
    @array = array
  end

  def push(new_item)
    @array.push(new_item)
  end

  def shift
    @array.shift
  end

  def peek
    @array.first
  end
end

@ary = Queue.new(["a", "b", "c", "d", "e"])