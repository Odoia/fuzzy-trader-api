module Presenters
  class Cryptocurrency
    attr_reader :open_value, :max_value, :min_value, :paper, :quantity_per_amount

    def initialize(attrs)
      @open_value = attrs['average']
      @max_value = attrs['max']
      @min_value = attrs['min']
      @paper = attrs['unit'].upcase
      @quantity_per_amount = attrs['quantity_per_amount'].to_s
      @type = 'cryptocurrency'
    end
  end 
end
