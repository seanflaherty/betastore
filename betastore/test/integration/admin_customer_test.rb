
# Go to /admin/products
# Click on new product
# Fill in the form with basic product information
# Verify the "product was created" flash message appears
# Click on the link to that new product
# Click on the link to edit that product
# Fill in the form to change the price of the product.
# Verify the price of the product was updated.
# Verify the "product was updated" flash message appears
# Click on the product again
# Click on the link to delete the product.
# Verify the product no longer appears in the product list

require 'test_helper'

class AdminCustomerTest < ActionDispatch::IntegrationTest

    def test_create_customer
      visit "/admin/customers"
      click_link("New Customer") 
      email
      name
      state_code
      zip_code
      fill_in 'Email', :with => 'test@test.com'
      fill_in 'Name', :with => 'Test Customer'
      fill_in 'State Code', :with => 'MD'
      fill_in 'Zip Code', :with => '20794'
      click_on("Create Product")
      assert_equal 'customer was created',
      flash[:notice] 
      visit "/admin/customers"
      click_link("Test Product")
      click_link("Edit Customer")
      fill_in 'Email', :with => 'newtest@test.com' 
      click_on("Create Customer")
      assert page.has_content 'newtest@test.com'
      click_link("Delete Customer")
      refute page.has_content?("Test Customer")
    end

  end