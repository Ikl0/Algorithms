# frozen_string_literal: true

require 'benchmark'

# Exercise 2
puts 'Введите n:'
n = gets.chomp.to_i
puts 'Введите k:'
k = gets.chomp.to_i

# n = 4
# k = 3

def generate_arrays(n, k)
  arrays = []
  k.times do
    arrays << Array.new(n) { rand(1..100) }.sort!
  end
  arrays
end

int_arrays = generate_arrays(n, k)
# p int_arrays
# A

def merge_arrays(arrays)
  merged_arrays = []
  arrays.each do |array|
    merged_arrays += array
    merged_arrays.sort!
  end
  merged_arrays
end
# p "Merged arrays #{merge_arrays(int_arrays)}"



# B

def merge(left_sorted, right_sorted)
  res = []
  l = 0
  r = 0

  loop do
    break if (r >= right_sorted.length) && (l >= left_sorted.length)

    if (r >= right_sorted.length) || ((l < left_sorted.length) && (left_sorted[l] < right_sorted[r]))
      res << left_sorted[l]
      l += 1
    else
      res << right_sorted[r]
      r += 1
    end
  end
  res
end

def divide_and_conquer(array_sliced)
  return array_sliced if array_sliced.length <= 1

  mid = array_sliced.length / 2 - 1
  left_sorted = divide_and_conquer(array_sliced[0..mid])
  right_sorted = divide_and_conquer(array_sliced[mid + 1..-1])
  merge(left_sorted, right_sorted)
end

def mergesort(arrays)
  merged_arrays = []
  arrays.each do |array|
    merged_arrays += array
  end
  # p "_________________________"
  # p merged_arrays
  divide_and_conquer(merged_arrays)
end

 # p Benchmark.measure {
 #   merge_arrays(int_arrays)
 # }.real
#
#  p Benchmark.measure {
#  mergesort(int_arrays)
#  }.real

# Exercise 3

def generate_string_arrays(n, k)
  arrays = []
  k.times do
    arrays << Array.new(n) { generate_string(5) }.sort!
  end
  arrays
end

def generate_string(number)
  chars = ('A'..'Z').to_a + ('a'..'z').to_a
  Array.new(number) { chars.to_a.sample }.join
end

string_arrays = generate_string_arrays(n, k)

 # p string_arrays
 # #
 #  puts "Merged arrays #{ merge_arrays(string_arrays)}"
 #  p mergesort(string_arrays)

# Exercise 4

def count_keys_equal(array,n,k)
  equal = Array.new(k){0}
  i = 0
  while i < n
    key = array[i]
    equal[key] += 1
    i += 1
  end
  equal
end

def count_keys_less(equal,k)
  less = Array.new(1){0}
  i = 1
  while i < k
    less << less[i - 1] + equal[i - 1]
    i += 1
  end
  less
end



def rearrange(array,n,k)
  less = count_keys_less(count_keys_equal(array, array.size, array.max + 1), array.max + 1)
  b = Array.new(n){0}
  _next = []
  j = 0
  while j < k
    _next << less[j] + 1
    j += 1
  end
  i = 0
  while i < n
    key = array[i]
    index = _next[key]
    b[index - 1] = array[i]
    _next[key] += 1
    i += 1
  end
  b
end

puts "arrray"
p arr = Array.new(n) { rand(1..k) }

 p equal = count_keys_equal(arr, arr.size, arr.max + 1)
 p count_keys_less(equal, arr.max + 1)
p rearrange(arr, arr.size, arr.max + 1)

