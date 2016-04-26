class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :sku
      t.string :avg_customer_review
      t.string :short_description
      t.string :sale_price
      t.string :image
    end
  end
end
