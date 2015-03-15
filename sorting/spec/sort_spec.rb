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

    context "when there are negative numbers" do
      it "returns the array sorted with negatives first" do
        expect(Sort.selection_sort([-3, 4, -8, 5, 12])).to eq([-8, -3, 4, 5, 12])
      end
    end

    context "when there are duplicate numbers" do
      it "returns the array with duplicates together" do
        expect(Sort.selection_sort([8, 4, 5, 8, 3])).to eq([3, 4, 5, 8, 8])
      end
    end

    context "when we have a large unordered array" do
      it "returns the array sorted" do
        expect(Sort.selection_sort([3, 1, 5, 2, 5, -2, 1, 5, -19, 30])).to eq([-19, -2, 1, 1, 2, 3, 5, 5, 5, 30])
      end
    end
  end
end