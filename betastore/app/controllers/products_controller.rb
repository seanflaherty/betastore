class ProductsController < ApplicationController
  def index
    @product_names = Product.order('name').where('name like ?', 'test%')
  end
end