class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.order('name')
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    #SCF WORKS!
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "Customer #{@customer.id} was updated.  "
    else
      render 'edit'
    end 
  end

  def destroy
    Customer.find(params[:id]).destroy
    redirect_to admin_customers_path, :flash => { :success => "Customer deleted." }
  end


  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to admin_customer_path(@customer), notice: "Customer #{@customer.id} was created.  "
    else
      render 'new'
    end
  end

  private
  def customer_params
    params.require(:customer).permit!
  end


end