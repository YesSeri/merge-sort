def merge_sort (array)
  result = []
  if array.length < 2
    array
  else
    left  = merge_sort(array[0..array.length/2-1])
    right = merge_sort(array[array.length/2..-1])
    result = merge(left, right)
  end
end
def merge (left, right)
  result = []
  while (left.any? && right.any?)
    if left[0]<right[0]
      result << left.shift
    else
      result << right.shift
    end
  end
  result += remaining(left) + remaining(right) #Only excutes one of the these.
end
def remaining(arr)
  result = []
  while arr.any?
    result << arr.shift
  end
  result
end
array = []
for i in 1..100
  array << rand(1..1000)
end

result = merge_sort(array) 

result.each_with_index do |r, i|
  if (i+1) % 10 == 0 
    puts "#{r}"
  else
    print "#{r}  ".ljust(5, " ")
  end
end
