class Admin::ProductsController < ApplicationController

  before_action :require_login

  def index
      @products = Product.order('name')
      redirect_to admin_login_path, alert: 'Please log in to continue'
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_product_path(@product), notice: "Product #{@product.id} was created.  "
    else
      render 'new'
    end
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


  private
  def product_params
    params.require(:product).permit(:name, :price)
  end

  def logged_in?
    session[:user_id].present?
  end

  def require_login
    unless logged_in?
      redirect_to admin_logins_path, danger: 'Please log in to continue'
    end
  end

end
