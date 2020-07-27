FactoryBot.define do
  factory :wallet, class: '::Wallet' do
    paper { 'btc' }
    quantity { 10 }
  end
end
