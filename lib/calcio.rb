require 'benchmark'
require 'pry'

class Calcio
  #
  #@param input [String] [input data]
  #
  def self.add(input)
    multiplication, sum, negatives = extract_numbers_and_delimiter(input)

    # return 0 if numbers.all? { |a| a.strip.empty? }

    # sum, negatives = filter_sum_and_negatives(numbers)

    raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    multiplication || sum
  end

  private

  #
  #@param input [String] [original input data]
  #
  def self.extract_numbers_and_delimiter(input)
    multiplication = nil
    if input.start_with?("//") && input.include?('*')
      delimiter_section, number_section = input.split("\n", 2)
      delimiter = parse_delimiter(delimiter_section[2..])
      numbers = number_section.split(Regexp.new(delimiter + "|[,\n]"))
      multiplication, negatives = filter_multiplication_and_negatives(numbers)
    elsif input.start_with?("//")
      delimiter_section, number_section = input.split("\n", 2)
      delimiter = parse_delimiter(delimiter_section[2..])
      numbers = number_section.split(Regexp.new(delimiter + "|[,\n]"))
      sum, negatives = filter_sum_and_negatives(numbers)
    else
      delimiter = /[,\n]/
      numbers = input.split(delimiter)
      sum, negatives = filter_sum_and_negatives(numbers)
    end
    [multiplication, sum, negatives]
  end

  #
  #@param delimiter [Array] [delimiter data]
  #
  def self.parse_delimiter(delimiter)
    if delimiter.start_with?("[") && delimiter.end_with?("]")
      delimiter[1..-2].split("][").map { |d| Regexp.escape(d) }.join("|")
    else
      Regexp.escape(delimiter)
    end
  end

  #
  #@param numbers [Array] [numbers data integer, float, negatives, etc]
  #
  def self.filter_sum_and_negatives(numbers)
    sum = 0
    negatives = []

    numbers.each do |num|
      number = num.to_i
      next if number > 1000
      if number < 0
        negatives << number
      else
        sum += number
      end
    end
    [sum, negatives]
  end

  # 
  # @param numbers [Array] [numbers data integer, float, negatives, etc]
  # 
  def self.filter_multiplication_and_negatives(numbers)
    multiplication = 1
    negatives = []

    numbers.each do |num|
      number = num.to_i
      next if number > 1000
      if number < 0
        negatives << number
      else
        multiplication *= number
      end
    end
    [multiplication, negatives]
  end
end

# Benchmark.bmbm do |x|
#   x.report("Calcio Performance") {Calcio.add(Set.new(1..100000).join(','))}
# end
# Rehearsal ------------------------------------------------------
# Calcio Performance   0.092679   0.005942   0.098621 (  0.098829)
# --------------------------------------------- total: 0.098621sec

#                          user     system      total        real
# Calcio Performance   0.083583   0.003335   0.086918 (  0.087018)