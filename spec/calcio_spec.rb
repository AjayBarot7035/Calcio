require 'rspec'
require './lib/calcio'

describe Calcio do
  describe '.add' do
    context 'when the input is an empty string' do
      it 'returns 0' do
        expect(described_class.add('')).to eq(0)
      end
		end

		context 'when the input is a single digit' do
		end

		context 'when the input is two numbers separated by a comma' do
		end

		context 'when the input is more than two numbers separated by a comma' do
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
