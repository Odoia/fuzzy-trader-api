module Presenters
  class Wallet
    attr_reader :open_value, :max_value, :min_value, :paper, :quantity, :total_value

    def initialize(attrs)
      @open_value = attrs['average'] || attrs['open'].to_s
      @max_value = attrs['max'] || attrs['high'].to_s
      @min_value = attrs['min'] || attrs['low'].to_s
      @paper = attrs['unit']&.upcase || attrs['symbol'].to_s
      @quantity = attrs['quantity'].to_s
      @total_value = attrs['type'] == 'action'? total_value_for_action : total_value_for_cryptocurrency

    end

    private

    def total_value_for_cryptocurrency
      (quantity.to_f / max_value.to_f).to_s
    end

    def total_value_for_action
      (quantity.to_f * max_value.to_f).to_s
    end
  end 
end
