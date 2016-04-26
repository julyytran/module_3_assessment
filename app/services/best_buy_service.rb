class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("http://api.bestbuy.com/v1/products")
  end

  def get_products(keyword)
  end

  private

  def parse(path)
    JSON.parse(connection.get(path).body)
  end
end
