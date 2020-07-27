module Api
  module V1
    class WalletController < ApplicationController
      before_action :wallet_params, only: [:create]

      def index
        result = index_wallet
        render status: 200, json: { data: result, status: 'Ok' }
      end

      def create
        result = create_wallet
        render status: 201, json: { data: result, status: 'Created' }
      end

      private

      def wallet_params
        return render_error if params['wallet'].blank?

        params.require(:wallet).permit(
          :paper,
          :quantity_per_amount
        )

      end

      def index_wallet
        ::Services::Wallet::Index.new.call
      end

      def create_wallet
        ::Services::Wallet::Create.new(
          paper: wallet_params[:paper],
          quantity: wallet_params[:quantity_per_amount]
        ).call
      end

      def render_error
        render nothing: true, status: 400, json: { status: 400, data: 'Bad Request' }
      end
    end
  end
end
