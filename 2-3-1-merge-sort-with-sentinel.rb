# http://en.wikipedia.org/wiki/Merge_sort

class MergeSort
  class << self
    def sort array
      return array if array.length <= 1
      
      left, right = [], []
      
      middle = (array.length / 2).round
      
      0.upto(middle - 1) { |i| left.push array[i] }
      middle.upto(array.length - 1) { |i| right.push array[i] }

      left = self.sort left
      
      right = self.sort right
      merge left, right
    end
    
    
    private
    
    
    def merge left, right
      result = []
      
      i, j = 0, 0
      p, r = left.length, right.length
      
      # sentinel
      left.push 1.0/0
      right.push 1.0/0
      
      0.upto(p + r - 1) do |k|
        if left[i] <= right[j]
          result[k] = left[i]
          i += 1
        else
          result[k] = right[j]
          j += 1
        end
      end
      
      result
    end
  end
end

if $0 == __FILE__

  require "test/unit"

  class MergeSortTest < Test::Unit::TestCase
    def test_merge_sort_with_sentinel
      sorted_array = MergeSort.sort [6, 3, 1, 2, 4, 8, 7, 5]
      assert_equal [1, 2, 3, 4, 5, 6, 7, 8], sorted_array
    end
  end

end