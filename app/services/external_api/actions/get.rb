module Services
  module ExternalApi
    module Actions
      class Get

        def initialize
        end

        def call
          all_actions
        end

        private

        def actions
          ['AAPL','IBM','PBR','AMZN','MSFT']
        end

        def all_actions
          actions.map do |paper|
            result = Faraday.get(url(paper))
            JSON.parse(result.body)
          end
        end

        def url(paper)
          "http://api.marketstack.com/v1/eod?access_key=#{token}&symbols=#{paper}&limit=1"
        end

        def token
          '7507233f78e6c602359df7e6939e1f7f'
        end
      end
    end
  end
end
