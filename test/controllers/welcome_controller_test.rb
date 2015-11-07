require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
    
    test "should get home index" do
        get :index
        assert_response :success
        assert_select "title", "Children Learning to Code in Orlando, FL | Code by Me"
    end
end
