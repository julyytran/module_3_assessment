class BestBuyService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("https://api.bestbuy.com/v1/products(longDescription=iPhone*|sku=7619002)")
  end

  def get_products(keyword)
  end

  private

  def parse(path)
    JSON.parse(connection.get(path).body)
  end
end
