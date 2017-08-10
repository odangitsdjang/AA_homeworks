# sluggish is bubble sort
def bubble_sort(arr)
  sorted = false

  until sorted
    sorted = true
    (0..arr.length-2).each do |i|
      j = i + 1
      if arr[i].length > arr[j].length
        arr[i], arr[j] = arr[j], arr[i]
        sorted = false
      end
    end
  end
  arr

end

#dominant is merge
def merge_sort(arr)
  return arr if length <= 1
  mid = arr.length/2
  left = merge_sort(arr[0...mid])
  right = merge_sort(arr[mid..-1])
  merge_helper(left, right)
end

def merge_helper(left,right)
  arr = []
  until left.empty? || right.empty?
    if left[0].length > right[0].length
      arr << right.shift
    else
      arr << left.shift
    end
  end
  arr += (left + right)
end

# clever
def clever_octopus(arr)
  longest = arr.first
  (1..arr.length-1).each do |i|
    longest = longest < arr[i].length ? arr[i] : longest
  end
  longest
end
# go through the array to find the direction
def slow_dance(direction, tiles_arr)
  tiles_arr.each_with_index do |tile ,i|
    return i if tile == direction
  end
end

# go through the hash to find the direction
def constant_dance(direction,tiles_hash)
  tiles_hash[direction]
end
