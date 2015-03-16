require 'rubygems'
require 'rspec'
require_relative '../merge_sort.rb'

describe 'Sort' do
  describe '.merge' do
    context "when the arguments are empty" do
      it "returns an empty array" do
        expect(Sort.merge([], [])).to eq([])
      end
    end

    context "when one of the arguments is empty" do
      it "returns the other array" do
        x = [3, 5, 18, 15]
        expect(Sort.merge(x, [])).to eq(x)
        expect(Sort.merge([], x)).to eq(x)
      end
    end

    context "when each array has 1 element" do
      it "returns an array with both elements sorted" do
        expect(Sort.merge([5], [2])).to eq([2, 5])
      end
    end

    context "when you have 2 large sorted arrays" do
      it "returns a sorted array that is the combination of the two" do
        x = [2, 4, 6, 8, 10, 12, 14, 16]
        y = [1, 3, 5, 7, 9, 11, 13, 15]
        expect(Sort.merge(x, y)).to eq((x + y).sort)
      end
    end
  end

  describe '.merge_sort' do
    context "when the argument is empty" do
      it "returns an empty array" do
        expect(Sort.merge_sort([])).to eq([])
      end
    end

    context "when the argument has 1 element" do
      it "returns the same array" do
        expect(Sort.merge_sort([1])).to eq([1])
      end
    end

    context "when the argument has sorted elements" do
      it "returns the same array" do
        expect(Sort.merge_sort([1, 2, 3])).to eq([1, 2, 3])
      end
    end

    context "when the argument has unsorted elements" do
      it "returns a sorted array" do
        expect(Sort.merge_sort([3, 5, 2, 1])).to eq([1, 2, 3, 5])
      end
    end

    context "when the argument has repeating elements" do
      it "returns a sorted array" do
        expect(Sort.merge_sort([2, 1, 2, 4, 5])).to eq([1, 2, 2, 4, 5])     
      end
    end

    context "when the argument is large and randomized" do
      it "returns a sorted array" do
        large_array = []
        100.times { large_array << rand(1000) }
        sorted_array = large_array.sort
        expect(Sort.merge_sort(large_array)).to eq(sorted_array)
      end
    end
  end
end