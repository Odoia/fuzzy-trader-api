require 'rails_helper'

describe '::Api::V1::WalletController', type: :request do

  let(:body) { JSON.parse response.body }

  let(:param) do
    {
      code: 'btc'
      qty: 1
    } 
  end
  let(:param_100) { { value: 100 } }
  let(:param_1) { { value: 1 } }
  let(:invalid_param) { { value: 'aaaa' } }

  context 'When need include active' do
    context 'When need a 1000 investiment' do
      it 'shoud be a 4 actions and 3 cryptocurrencys investment' do
        post '/api/v1/investment', params: param

        expect(response.status).to eq 201
        expect(::Wallet.count).to eq 1
      end
    end
  end
end
