module Sort
  def self.merge_sort(array)
    if array.size <= 1
      array
    else
      half = (array.size / 2).floor
      first_half = merge_sort(array[0...half])
      second_half = merge_sort(array[half..-1])
      merge(first_half, second_half)
    end
  end

  def self.merge(first_half, second_half)
    if first_half.size == 0
      second_half
    elsif second_half.size == 0
      first_half
    elsif first_half[0] < second_half[0]
      [first_half[0]] + merge(first_half[1..first_half.size], second_half)
    else
      [second_half[0]] + merge(first_half, second_half[1..second_half.size])
    end
  end
end