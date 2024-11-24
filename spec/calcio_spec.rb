require 'rspec'
require './lib/calcio'

describe Calcio do
  describe '.add' do
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
		end

		context 'when a custom delimiter is specified' do
		end

		context 'when a custom delimiter, comma, newline specified' do
		end

		context 'when input has negative numbers' do
		end

		context 'when user entered wrong input' do
		end

		context 'when user entered big input' do
		end
	end
end
