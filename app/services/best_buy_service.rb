class BestBuyService
  attr_reader :connection

  def initialize
    uri = URI.parse(URI.encode(url.strip))
    @connection = Faraday.new("https://api.bestbuy.com/v1/products")
  end

  def get_products(keyword)
  end

  private

  def parse(path)
    JSON.parse(connection.get(path).body)
  end
end
