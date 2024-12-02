require 'rspec'
require './lib/calcio'

describe Calcio do
  describe '.add' do
    let(:big_input) { Set.new(1..100000).join(',') }

    context 'when the input is an empty string' do
      it 'returns 0' do
        expect(described_class.add('')).to eq(0)
      end

      it 'returns 0 even the input has space issue' do
        expect(described_class.add(' ,  , ')).to eq(0)
      end
    end

    context 'when the input is a single digit' do
      it 'returns 1' do
        expect(described_class.add('1')).to eq(1)
      end
    end

    context 'when the input is two numbers separated by a comma' do
      it 'returns the sum of the numbers' do
        expect(described_class.add('2,5')).to eq(7)
      end
    end

    context 'when the input is more than two numbers separated by a comma' do
      it 'returns the sum of the numbers' do
        expect(described_class.add('2,3,5,6')).to eq(16)
      end
    end

    context 'when the input has new line delimiters between numbers' do
      it 'returns the sum of all numbers' do
        expect(described_class.add("1\n2,3,4")).to eq(10)
      end
    end

    context 'when a custom delimiter is specified' do
      it 'returns the sum of all numbers using the custom delimiter' do
        expect(described_class.add("//;\n1;2;5")).to eq(8)
      end

      it 'returns the sum of all numbers using a different custom delimiter' do
        expect(described_class.add("//|\n2|3|4|2")).to eq(11)
      end

      it 'returns the multiple of all numbers using a different custom delimiter' do
        expect(described_class.add("//*\n1*4*5")).to eq(20)
      end
    end

    context 'when a custom delimiter, comma, newline specified' do
      it 'returns the sum of all numbers with returns the sum of all numbers' do 
        expect(described_class.add("//;\n1;2,5")).to eq(8)
      end
    end

    context 'when input has negative numbers' do
      it 'raises an exception with a message' do
        expect { described_class.add("1,-2,3") }.to raise_error("Negative numbers not allowed: -2")
      end
    end

    context 'when user entered wrong input' do
      it 'ignore the wrong input' do
        expect(described_class.add("1,*2,3")).to eq(4)
      end
    end

    context 'when user entered big input' do
      it 'returns 500500' do
        expect(described_class.add(big_input)).to eq(500500)
      end
    end

    context 'extra edge case scenarios' do
      it 'returns 6' do
        expect(described_class.add("//[***]\n1***2***3")).to eq(6)
        expect(described_class.add("//[*][%]\n1*2%3")).to eq(6)
      end
    end
  end
end

# Requirements
# New custom delimeter for multiplication *
# new test cases for this
