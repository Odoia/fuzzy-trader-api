require 'rails_helper'

describe '::Api::V1::WalletController', type: :request do

  before do
    execute_actions
  end

  let(:execute_actions) {}

  let(:body) { JSON.parse response.body }

  let(:param) do
    { wallet: {
      paper: 'pbr',
      quantity_per_amount: '10'
    }}
  end

  context 'when need use wallet' do
    context 'when register one investiment in wallet' do

      let(:execute_actions) do
        post '/api/v1/wallet', params: param
      end

      it 'should be return a 201 status' do
        expect(response.status).to eq 201
      end

      it 'wallet counter should be return 1' do
        expect(::Wallet.count).to eq 1
      end

      it 'wallet paper shoud be pbr' do
        expect(::Wallet.first.paper).to eq 'pbr'
      end

      it 'paper pbr quantity shoud be 10' do
        expect(::Wallet.first.paper).to eq 'pbr'
        expect(::Wallet.first.quantity).to eq 10
      end
    end
  end
end
