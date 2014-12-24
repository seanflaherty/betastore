require 'test_helper'

class AdminProductTest < ActionDispatch::IntegrationTest

    def test_create_product
      visit "/admin/products"
      #fill_in "Find out when we go live", with: 'test@example.com'
      click_link("New Product") 
      fill_in 'Name', :with => 'Test Product'
      fill_in 'Price', :with => '9.99'
      fill_in 'Image url', :with => 'http://www.clipartbest.com/cliparts/nTE/XXK/nTEXXKkTA.png'
      click_on("Create Product")
      assert_equal 'product was created',
      flash[:notice] 
      visit "/admin/products"
      click_link("Test Product")
      click_link("Edit Product")
      fill_in 'Price', :with => '1.11' 
      click_on("Create Product")
      product = Product.last
      assert_equal '1.11', product.price
      click_link("Delete Product")
    end


# Click on the link to that new product
# Click on the link to edit that product
# Fill in the form to change the price of the product.
# Verify the price of the product was updated.
# Verify the "product was updated" flash message appears
# Click on the product again
# Click on the link to delete the product.
# Verify the product no longer appears in the product list



  end