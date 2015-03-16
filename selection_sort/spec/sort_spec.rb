require 'rubygems'
require 'rspec'
require_relative '../sort.rb'

describe 'Sort' do
  describe '.selection_sort' do
    context "when the argument is empty" do
      it "returns an empty array" do
        expect(Sort.selection_sort([])).to eq([])
      end
    end

    context "when the argument has 1 number" do
      it "returns the same array" do
        expect(Sort.selection_sort([1])).to eq([1])
      end
    end

    context "when the argument has negative numbers" do
      it "returns the array sorted with negatives first" do
        expect(Sort.selection_sort([-3, 4, -8, 5, 12])).to eq([-8, -3, 4, 5, 12])
      end
    end

    context "when the argument has duplicate numbers" do
      it "returns the array with duplicates together" do
        expect(Sort.selection_sort([8, 4, 5, 8, 3])).to eq([3, 4, 5, 8, 8])
      end
    end

    context "when the argument has sorted elements" do
      it "returns a sorted array" do
        expect(Sort.selection_sort([1, 2, 3])).to eq([1, 2, 3])
      end
    end

    context "when the argument is large and randomized" do
      it "returns the array sorted" do
        large_array = []
        100.times { large_array << rand(1000) }
        sorted_array = large_array.sort
        expect(Sort.selection_sort(large_array)).to eq(sorted_array)
      end
    end
  end
end