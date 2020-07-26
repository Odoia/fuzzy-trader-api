module Services
  module Cryptocurrency
    class GetByAmount

      def initialize(amount:)
        @amount = amount.to_f
      end

      def call
        cryptocurrency_by_amount
      end

      private

      attr_reader :amount

      def cryptocurrency_by_amount
        result = {}
        all_cryptocurrency.each do |crypto|
          res = crypto['payload']
          if res['max'].to_f <= amount
            res['quantity_per_amount'] = quantity_per_amount(quantity: res['max'])
            result[res['unit']] = res
          end
        end
        result
      end

      def quantity_per_amount(quantity:)
        (quantity.to_f * amount)
      end

      def all_cryptocurrency
        @all_cryptocurrency ||= ::Services::ExternalApi::Cryptocurrency::Get.new.call
      end
    end
  end
end
