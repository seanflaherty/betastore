require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  def test_new
    #SCF TODO
    get :new
    assert_select "form[action=/subscriptions]"
    assert_select "input[name='subscription[email]']"
    assert_select "input[type=submit][value=Create Subscription]"
    assert_response :success
  end

  def test_create
    #SCF TODO
    assert_difference 'Customer.count' do
      post :create, customer: { email: 'test@example.com' }
    end
    customer = Customer.last
    assert_equal 'test@example.com', subscription.email
    assert_redirected_to subscription_path(subscription)
    assert_equal 'Subscription was successfully created.',
      flash[:notice] 
  end
  
end