require 'benchmark'


def linear_search(arr,x)
steps = 0
ans = ''
arr.each do |el|
  steps += 1
  if el == x
    ans =  "The element was found in #{steps} iterations."
    break
  else
    ans =  nil
    end
end
ans
end
p linear_search([-7, 1, 3, 3, 4, 7, 11, 13],3)

def binary_search(arr, item)
  arr.sort!

  min = 0
  max = arr.length - 1


  while min <= max
    i = (min + max) / 2

    if arr[i] == item
      return "#{item} found at position #{i}"
    elsif arr[i] > item
      max = i - 1
    else arr[i] < item
    min = i + 1
    end
  end

  return "#{item} not found in this array"
end

p binary_search([ -7, 2, 2, 3, 4, 7, 8, 11, 13],2)
p binary_search([ 8, 1, 2, 1, 5, 7, 10, 8],8)

def binary_search_index(arr, item)
  arr.sort!

  min = 0
  max = arr.length - 1


  while min <= max
    i = (min + max) / 2

    if arr[i] == item
      return "#{item} found at position #{i}"
    elsif arr[i] > item
      max = i - 1
    else arr[i] < item
    min = i + 1
    end
  end

  return "#{item} not found in this array, necessary position #{min}"
end
p binary_search_index([ 8, 1, 2, 1, 5, 7, 10, 8],11)

# улучшенный линейный поиск останавливается после нахождения элемента
#
def recursive_liner(arr,i,x)
  if(i>arr.length)
    return "No such element"
  elsif (arr[i]==x)
    return "Element in position #{i}"
  else
    return recursive_liner(arr,i+1,x)
    end
end

p recursive_liner([1,4,6,8,9,54,2,43],0,10)

arr = Array.new(500){ rand(500) }
bench1 = Benchmark.measure{recursive_liner(arr,0,10)}
p bench1.real