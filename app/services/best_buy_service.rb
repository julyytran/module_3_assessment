require 'net/http'

class BestBuyService
  attr_reader :connection

  def get_products(keyword)
    url = "https://api.bestbuy.com/v1/products(longDescription=#{keyword}*)?show=sku,name,customerReviewAverage,shortDescription,salePrice,image&apiKey=#{ENV["BEST_BUY_KEY"]}&format=json"
    uri = URI.parse(URI.encode(url.strip))
    response = Net::HTTP.get(uri)
    parse(response)["products"]
  end

  private

  def parse(response)
    JSON.parse(response)
  end
end
