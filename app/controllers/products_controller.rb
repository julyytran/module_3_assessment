class ProductsController < ApplicationController
  def search
    BestBuyProduct.new(params[:q])
    @products = Product.all
  end
end
