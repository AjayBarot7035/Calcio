class Calcio
  #
  #@param input [String] [input data]
  #
  def self.add(input)
    return 0 if input.strip.empty?
    input.split(',').map(&:to_i).reduce(:+)
  end
end
