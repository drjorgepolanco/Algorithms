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
  end
end