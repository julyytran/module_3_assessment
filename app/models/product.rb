class Product < OpenStruct
  def initialize(keyword)
    service = BestBuyService.new
    @products = service.get_products(keyword)

    @products.each do |product|
      Product.create(
      name: product["name"],
      sku: product["sku"],
      avg_customer_review: product["customerReviewAverage"],
      short_description: product["shortDescription"],
      sale_price: product["salePrice"],
      image: product["image"]
      )
  end
end
