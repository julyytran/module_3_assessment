RSpec.describe "best buy service" do
  it "returns products for a search term" do
    VCR.use_cassette 'best_buy_service#get_products' do
      service = BestBuyService.new
      @products = service.get_products("sennheiser")
    end

    expect(@products.count).to eq 15
  end
end
