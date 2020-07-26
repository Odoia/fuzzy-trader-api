module Api
  module V1
    class InvestmentController < ApplicationController

      def show
        if params['value'].to_f > 0.0
          result = investments_by_amount
          render status: 200, json: { data: result, status: 'Ok' }
        else
          render nothing: true, status: 404, json: { status: 404, data: 'Not Found' }
        end
      end

      private

      def investments_by_amount
        ::Services::Investments::AllByAmount.new(amount: params['value']).call
      end
    end
  end
end
