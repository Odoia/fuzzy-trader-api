module Services
  module Investments
    class AllByAmount

      def initialize(amount:)
        @amount = amount
      end

      def call
        all_investiments_per_amount
      end

      private

      attr_reader :amount

      def all_investiments_per_amount
        result = {}
        result.merge(actions, cryptocurrencys)
      end

      def actions
        @actions ||= ::Services::Actions::GetByAmount.new(amount: amount).call
      end

      def cryptocurrencys
        @cryptocurrencys ||= ::Services::Cryptocurrency::GetByAmount.new(amount: amount).call
      end
    end
  end
end
