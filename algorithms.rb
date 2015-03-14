# ======
# Arrays
# ======

# - Push:    0(1) stable
# - Insert:  0(n) slow linear (As the size increases)
# - Include: 0(n) super slow, linear

def time(count = 1000, &block)
  start = Time.now
  1000.times { yield }
  end_time = Time.now
  puts (end_time - start) * 1000
end

def create_array(size)
  Array.new(size) { |x| x }
end

10.times do |n|
  size = 10000 * (n + 1)
  arr = create_array(size)
  time do
    arr.include?(size + 1)
    arr.insert(2, size / 2)
    arr.push(2)
  end
end


# =========
# Array Max
# =========

# Given an array of negative/positive integers, find the largest element. 
# DO NOT use Math.max.

array1 = [34 , 16, 1, 66, 50, 42, -91, -145]
array2 = [9, 18, -13, 612, 45, 23, -121, 8]

def max(array)
  if array.length == 0
    return nil
  end
  largest = array.first
  array.each do |number|
    if largest < number
      largest = number
    end
  end
  largest
end

puts "The largest number is #{max(array1)}"
# -> The largest number is 66


# ============
# Array Middle
# ============

# Given an array of negative/positive integers, return the element in the center 
# position of the array. If the array has an even number of elements, return the 
# average of the two middle elements instead.

def middle_number(array)
  if array.length == 0
    return nil
  elsif array.length % 2 == 0
    (array[array.length / 2] + array[array.length / 2] -1).to_f / 2
  else
    array[array.length / 2]
  end
end

puts "The number in the middle is #{middle_number(array1)}"
# -> The number in the middle is 49.5


# =============
# Array Zip Sum
# =============

# Given two arrays of negative/positive integers, return a new array such that 
# each element at index n is the sum of the two elements from the other arrays 
# at their index n's.

def zip_sum(array, array2)
  new_arr = []
  array.length.times do |index|
    new_arr.push(array[index] + array2[index])
  end
  new_arr
end

puts "The new array is #{zip_sum(array1, array2)}"
# -> The new array is [43, 34, -12, 678, 95, 65, -212, -137]


# ==========
# Small Swap
# ==========

# Given an array of negative/positive integers, swap the smallest element of the 
# array with the first element of the array.

array = [ 4, 3, 0, 2, 2 ]

def min(array)
  if array.length == 0
    nil
  end
  smallest = array.first
  array.each do |element|
    if smallest > element
      smallest = element
    end
  end
  smallest
end

smallest = min(array)

if smallest == array.first
  array
else
  hash = Hash[array.map.with_index.to_a]
  index = hash[smallest]
  array.slice!(index, 1)
  first = array.shift
  array.insert(index - 1, first)
  array.unshift(smallest)
  array
end

puts "The swapped array is #{array}"
# The swapped array is [0, 3, 2, 4, 2]

# ---------------------
# Cleaner way would be:
# ---------------------

array = [ 9, 4, 3, 1, 12, 5, 21 ]

def swap(array)
  # 1. We get the smallest element with this hacky method.
  smallest = array.min
  # 2. Then, if the smallest is already the first element,
  #    just return the array as is. Not modified.
  if smallest == array.first
    array
  else
    # 3. If not, 'first' will be the first element in the array.
    #    The method shift(), takes the first element in an array
    #    returns it.
    first = array.shift
    # 4. We convert the array into a hash to find the index faster.
    #    We could use the method 'include()', but it is really inefficient
    #    because it has to iterate through the whole array and compare
    #    each element with the given one to see if it matches.
    hash = Hash[array.map.with_index.to_a]
    # 5. Then we get the index using hash[smallest].
    index = hash[smallest]
    # 6. We destructively remove the first element in the array.
    #    The method slice has two parameters, the first one is the
    #    starting position where it will start to be applied, and
    #    the second parameter is the amount of elements we plan to
    #    remove starting from the position in the first parameter.
    #    In other words, cut one position in the array starting from
    #    position 3.
    array.slice!(index, 1)
    # 7. Then insert the first element of the array in that position.
    array.insert(index, first)
    # 8. Then put the smallest element in the first position.
    #    Note that 'shift()' cuts the first element, I bet is easy to 
    #    guess what 'unshift()' does.
    #    If you guessed it adds an element to the first position, you
    #    are right.
    array.unshift(smallest)
    # 9. Finally, we return the modified array.
    array
  end
end

puts "The swapped array is #{swap(array)}"
# The swapped array is [1, 4, 9, 3, 12, 5, 21]

# ----------------
# Even better way:
# ----------------

array = [ 9, 4, 1, 3, 12, 5, 0 ]

def small_swap(array)
  # 1. We declare the variables
  small_index = 0
  small_element = array.first

  # 2. Using a for loop we iterate from 0 to the length of 
  #    the array, being 'i' the current index
  for i in 0...array.length
    # 3. If 'small_element' is greater than the current element
    if small_element > array[i]
      # 4. then, the value of 'small_element' will become the 
      #    value of the current element
      small_element = array[i]
      # 5. We set the value of 'small_index' to i
      small_index = i
    end
  end
  # 6. Now, the value of the element positioned in the 
  #    index of the smallest one will become the first element,
  #    in this case, array[6] (the seventh position) will become 9
  array[small_index] = array[0]
  # 7. And the first element will become the smallest,
  #    in this case, array[0] will be 0
  array[0] = small_element
  # 8. Lastly, we return the modified array.
  array
end

puts "The swapped array is #{small_swap(array)}"
# The swapped array is [0, 4, 1, 3, 12, 5, 9]


# ========
# Zero Sum
# ========

# Given an array of negative/positive integers, return true if there exists two 
# numbers whose sum is zero.
array = [ 5, -9, 2, 9 ]

def zero_sum(array, sum = 0)
  for x in 0...array.length
    for y in x...array.length
      if array[x] + array[y] == sum
        return true
      end
    end
  end
  false
end

puts zero_sum(array)


# ==========
# Zero Sum 3
# ==========

# Given an array of negative/positive integers, return true if there exists 
# three numbers whose sum is zero.

array_true_1 = [ 1, 3, 2, -3 ]
array_true_2 = [ 0, 2, -2 ]
array_false_1 = [ 5, 7, 2, 9 ]
array_false_2 = [ 1, 1 ]

def zero_sum3(array)
  array.each do |i|
    if zero_sum(array, -1 * i)
      return true
    end
  end
  false
end

puts zero_sum3(array_true_1) # -> true
puts zero_sum3(array_true_2) # -> true
puts zero_sum3(array_false_1) # -> false
puts zero_sum3(array_false_2) # -> false