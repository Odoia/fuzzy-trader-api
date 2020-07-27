module Services
  module ExternalApi
    module Cryptocurrency
      class Get

        def initialize(paper: nil)
          @paper = paper
        end

        def call
          return all_cryptocurrency if paper.nil?

          one_cryptocurrency
        end

        private

        attr_reader :paper

        def cryptocurrency
          ['BTC','DOGE','LTC']
        end

        def all_cryptocurrency
          cryptocurrency.map do |crypto|
            result = Faraday.new(
              url: url(crypto),
              headers: { 
                'ACCEPT' => 'application/json',
                :Authorization => "bearer #{token}"
              }
            ).get
            JSON.parse(result.body)
          end
        end

        def one_cryptocurrency
          result = Faraday.new(
            url: url(paper),
            headers: { 
              'ACCEPT' => 'application/json',
              :Authorization => "bearer #{token}"
            }
          ).get
          JSON.parse(result.body)
        end

        def token
          'eab3cc15e725b428432b22f971d9be8775645ced'
        end

        def url(crypto)
          "https://api.cryptoapis.io/v1/bc/#{crypto.downcase}/mainnet/txs/fee"
        end
      end
    end
  end
end
