module Presenters
  class Action
    attr_reader :open_value, :max_value, :min_value, :paper, :quantity_per_amount

    def initialize(attrs)
      @open_value = attrs['open'].to_s
      @max_value = attrs['high'].to_s
      @min_value = attrs['low'].to_s
      @paper = attrs['symbol'].upcase
      @quantity_per_amount = attrs['quantity_per_amount'].to_i.to_s
      @type = 'action'
    end
  end 
end
