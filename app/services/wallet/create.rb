module Services
  module Wallet
    class Create

      def initialize(paper:, quantity:)
        @paper    = paper
        @quantity = quantity
      end

      def call
        wallet_create
      end

      private

      attr_reader :paper, :quantity

      def wallet_create
        result = ::Wallet.new(params_to_save)
        result.save
        result
      end

      def params_to_save
        {
          paper: paper,
          quantity: quantity
        }
      end
    end
  end
end
