class Admin::ProductsController < ApplicationController
  def index
    @products = Product.order('name')
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    #SCF WORKS!
    if @product.update(product_params)
      redirect_to admin_product_path(@product), notice: "Product #{@product.id} was updated.  "
    else
      render 'edit'
    end 
  end

  def destroy
    Product.find(params[:id]).destroy
    redirect_to admin_products_path, :flash => { :success => "Product deleted." }
  end


  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product), notice: "Product #{@product.id} was created.  "
    else
      render 'new'
    end
  end

  private
  def product_params
    params.require(:product).permit!
  end


end