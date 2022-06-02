require 'benchmark'

BASE = 10
def radix_sort(integers_array)
  max_length = false
  placement = 10

  until max_length
    max_length = true
    # declare and initialize buckets
    buckets = Array.new(BASE) { [] }
    # split integers_array between arrays
    integers_array.each do |number|
      unit = number / placement
      buckets[unit % BASE].push(number)
      max_length = false if max_length && unit > 0
    end
    # empty array into integers_array array
    position = 0
    0.upto(9) do |index|
      buck = buckets[index]
      buck.each do |item|
        integers_array[position] = item
        position += 1
      end
    end
    placement *= BASE
  end
  integers_array
end

# arr = Array.new(1_000_000){ rand(0..100_000) }
# bench1 = Benchmark.measure{radix_sort(arr)}
# p bench1.real


def quick_sort(a,lo,hi)
  if lo<hi
    p=partition(a,lo,hi)
    quick_sort(a,lo,p-1)
    quick_sort(a,p+1,hi)
  end
  return a
end

def partition(a,lo,hi)
  i=lo
  j=hi+1
  pivot= a[lo]
  while true
    #Loop to increment i
    begin
      i+=1
      break if i==hi
    end while a[i]<pivot
    #Loop to increment j
    begin
      j-=1
      break if j==lo
    end while a[j]>pivot
    # break the loop if pointers cross
    break if i>=j
    #Swap arr[i] and arr[j]
    temp=a[i]
    a[i]=a[j]
    a[j]=temp
  end
  # Swap arr[lo] with arr[j]
  temp=a[lo]
  a[lo]=a[j]
  a[j]=temp
  return j
end

# arr = Array.new(1_000_000){ rand(0..100_000) }
# bench1 = Benchmark.measure{quick_sort(arr, 0,arr.size-1)}
# p bench1.real

def insertion_sort(array)
  for i in 1...(array.length)  # Step 1
    j = i # Step 2
    while j > 0 # Step 3
      if array[j-1] > array[j] # Step 4
        temp = array[j]
        array[j] = array[j-1]
        array[j-1] = temp
      else
        break
      end
      j = j - 1 # Step 5
    end
  end
  return array
end

i = 100_000
10.times do
  arr = Array.new(i){ rand(0..100_000) }
  bench1 = Benchmark.measure{insertion_sort(arr)}
  p bench1.real
  i += 100_000
end


