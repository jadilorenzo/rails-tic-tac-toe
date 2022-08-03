require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get username:string" do
    get users_username:string_url
    assert_response :success
  end

  test "should get password:string" do
    get users_password:string_url
    assert_response :success
  end
end
