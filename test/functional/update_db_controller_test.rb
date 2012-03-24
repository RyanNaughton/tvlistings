require 'test_helper'

class UpdateDbControllerTest < ActionController::TestCase
  test "should get update_db" do
    get :update_db
    assert_response :success
  end

end
