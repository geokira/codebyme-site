require 'test_helper'

class WelcomeControllerTest < ActionController::TestCase
    
    def setup
        @base_title = "Providing a Fun Learning environment for Young Coders and Creators in Orlando, FL"
    end
    
    test "should get home index" do
        get :index
        assert_response :success
        assert_select "title", "For Parents | #{@base_title}"
    end
    
    test "should get schools page" do
        get :schools
        assert_response :success
        assert_select "title", "For Schools | #{@base_title}"
    end
    
    test "should get teachers page" do
        get :teachers
        assert_response :success
        assert_select "title", "For Teachers | #{@base_title}"
    end
end
