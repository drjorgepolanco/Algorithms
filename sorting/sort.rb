module Sort
  def self.selection_sort(array)
    if array.length <= 1
      return array
    end
    for x in 0...array.length
      swap(array, x)
    end
    array
  end

  def self.swap(array, x)
    smallest = array[x]
    smallest_index = x
    for i in x...array.length
      if smallest > array[i]
        smallest = array[i]
        smallest_index = i
      end
    end
    array[smallest_index] = array[x]
    array[x] = smallest
  end
end

print Sort.selection_sort([3, 1, 5, 2, 5, -2, 1, 5, -19, 30])