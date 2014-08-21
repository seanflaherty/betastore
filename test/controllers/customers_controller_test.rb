require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  def test_new
    
    get :new
    assert_select "form[action=/customers]"
    assert_select "input[name='customer[email]']"
    assert_select "input[type=submit][value=Create Subscription]"
    assert_response :success
  end

  def test_create
    assert_difference 'Subscription.count' do
      post :create, subscription: { email: 'test@example.com' }
    end
    subscription = Subscription.last
    assert_equal 'test@example.com', subscription.email
    assert_redirected_to subscription_path(subscription)
    assert_equal 'Subscription was successfully created.',
      flash[:notice] 
  end
  
end