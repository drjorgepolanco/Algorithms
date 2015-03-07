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

puts [34 , 16, 1, 66, 50, 42, -91, -145].max
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