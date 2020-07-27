module Services
  module Actions
    class GetByAmount

      def initialize(amount:)
        @amount = amount.to_f
      end

      def call
        actions_by_amount
      end

      private

      attr_reader :amount

      def actions_by_amount
        result = {}
        all_actions.each do |action|
          res = action['data'].first
          if res['high'] <= amount
            res['quantity_per_amount'] = quantity_per_amount(quantity: res['high'])
            result[res['symbol']] = ::Presenters::Action.new(res)
          end
        end
        result
      end

      def quantity_per_amount(quantity:)
        (amount / quantity.to_f)
      end

      def all_actions
        @all_actions ||= ::Services::ExternalApi::Actions::Get.new.call
      end
    end
  end
end
