require 'test_helper'

class AdminProductTest < ActionDispatch::IntegrationTest

    def test_create_product
      visit "/admin/products"
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
      assert page.has_content? '1.11'
      click_link("Delete Product")
      refute page.has_content?("Test Product")
    end

  end