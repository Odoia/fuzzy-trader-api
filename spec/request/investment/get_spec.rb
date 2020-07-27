require 'rails_helper'

describe '::Api::V1::InvestmentController', type: :request do

  let(:body) { JSON.parse response.body }

  let(:param_1000) { { value: 1000 } }
  let(:param_100) { { value: 100 } }
  let(:param_1) { { value: 1 } }
  let(:invalid_param) { { value: 'aaaa' } }

  context 'When need search a investiment' do
    context 'When need a 1000 USD investiment' do
      it 'shoud be return 7 investments' do
        get '/api/v1/investment', params: param_1000

        expect(response.status).to eq 200
        expect(body['data'].count).to eq 7
      end
    end

    context 'When need a 100 USD investiment' do
      it 'shoud be return 4 investments' do
        get '/api/v1/investment', params: param_100

        expect(response.status).to eq 200
        expect(body['data'].count).to eq 4
      end
    end

    context 'When need a 1 USD investiment' do
      it 'shoud be return 2 investments' do
        get '/api/v1/investment', params: param_1

        expect(response.status).to eq 200
        expect(body['data'].count).to eq 2
      end
    end

    context 'When pass a invalid value investiment' do
      it 'shoud be a 404 error' do
        get '/api/v1/investment', params: invalid_param

        expect(response.status).to eq 404
        expect(body['data']).to eq 'Not Found'
      end
    end
  end
end
