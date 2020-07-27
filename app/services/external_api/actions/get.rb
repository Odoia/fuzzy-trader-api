module Services
  module ExternalApi
    module Actions
      class Get

        def initialize(paper: nil)
          @paper = paper
        end

        def call
          return all_actions if paper.nil?

          one_action
        end

        private

        attr_reader :paper

        def actions
          ['AAPL','IBM','PBR','AMZN','MSFT']
        end

        def all_actions
          actions.map do |paper|
            result = Faraday.get(url(paper))
            JSON.parse(result.body)
          end
        end

        def one_action
          result = Faraday.get(url(paper))
          JSON.parse(result.body)
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
