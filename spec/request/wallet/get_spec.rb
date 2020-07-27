require 'rails_helper'

describe '::Api::V1::WalletController', type: :request do

  before do
    execute_actions
  end

  let(:execute_actions) {}

  let(:body) { JSON.parse response.body }

  let(:wallet_btc) { FactoryBot.create(:wallet) }
  let(:wallet_ibm) { FactoryBot.create(:wallet, paper: 'ibm', quantity: 5) }

  context 'when need use wallet' do
    context 'when see all investiments on wallet' do
      let(:execute_actions) do
        wallet_btc
        wallet_ibm
        get '/api/v1/wallet'
      end

      it 'should be status 200' do
        expect(response.status).to eq 200
      end

      it 'wallet count should be 2' do
        expect(::Wallet.count).to eq 2
      end

      it 'wallet first paper is btc' do
        expect(body['data'].first['paper']).to eq 'BTC'
      end

      it 'wallet second paper is ibm' do
        expect(body['data'].second['paper']).to eq 'IBM'
      end
    end
  end
end
