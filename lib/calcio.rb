class Calcio
  #
  #@param input [String] [input data]
  #
  def self.add(input)
    numbers, delimiter = extract_numbers_and_delimiter(input)

    return 0 if numbers.all? { |a| a.strip.empty? }

    sum, negatives = filter_sum_and_negatives(numbers)

    raise "Negative numbers not allowed: #{negatives.join(', ')}" unless negatives.empty?

    sum
  end

  private

  #
  #@param input [String] [original input data]
  #
  def self.extract_numbers_and_delimiter(input)
    if input.start_with?("//")
      delimiter_section, number_section = input.split("\n", 2)
      delimiter = parse_delimiter(delimiter_section[2..])
      numbers = number_section.split(Regexp.new(delimiter + "|[,\n]"))
    else
      delimiter = /[,\n]/
      numbers = input.split(delimiter)
    end
    [numbers, delimiter]
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
      if number < 0
        negatives << number
      else
        sum += number
      end
    end
    [sum, negatives]
  end
end
