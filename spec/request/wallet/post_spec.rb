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

  let(:wallet_btc) { FactoryBot.create(:wallet) }
  let(:wallet_ibm) { FactoryBot.create(:wallet, paper: 'ibm' , quantity: 5) }

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
