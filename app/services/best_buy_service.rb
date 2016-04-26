class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("http://api.bestbuy.com/v1/products/")
  end

  def get_products(keyword)
    parse("search=#{keyword}?show=name,sku,salePrice,customerReviewAverage,shortDescription,image&format=json&apiKey=#{ENV["BEST_BUY_KEY"]}")
  end

  private

  def parse(path)
    JSON.parse(connection.get(path).body)
  end
end
