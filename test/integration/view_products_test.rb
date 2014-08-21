require 'test_helper'

class ViewProductsTest < ActionDispatch::IntegrationTest
 def test_products
  visit "/"
  assert page.has_content?('Hat'), 'could not find product price'
  click_on "Hat"
  assert page.has_content?('This is a hat.'), 'Could not find product name'
  click_on "Add to Cart"
  assert page.has_content?('Shopping Cart'), 'Could not find page title'
  assert page.has_content?('5.99')
  click_on 'Hat'
  click_on 'Add to Cart'
  assert page.has_content?('11.98'), 'Could not find total price'
 end 
end
