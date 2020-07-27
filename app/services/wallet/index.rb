module Services
  module Wallet
    class Index

      def initialize
      end

      def call
        wallet_create
      end

      private

      attr_reader :paper, :quantity

      def wallet_create
        wallet = {}
        ::Wallet.all.map do |w|
          action = action(w.paper)
          crypto = cryptocurrency(w.paper)

          unless action['data'].blank?
            action_with_quantity = action['data'].first
              .merge(
                'quantity' => w.quantity,
                'type' => 'action'
            )
            result = ::Presenters::Wallet.new(action_with_quantity)
          else
            crypto_with_quantity = crypto['payload']
              .merge(
                'quantity' => w.quantity,
                'type' => 'cryptocurrency'
            )
            result = ::Presenters::Wallet.new(crypto_with_quantity)
          end

          wallet.merge(result.as_json)
        end
      end

      def action(paper)
        ::Services::ExternalApi::Actions::Get.new(paper: paper).call
      end

      def cryptocurrency(paper)
        ::Services::ExternalApi::Cryptocurrency::Get.new(paper: paper).call
      end

    end
  end
end
