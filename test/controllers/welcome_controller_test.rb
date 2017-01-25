require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get welcome_index_url
    assert_response :success
  end

  test "should get generate:post" do
    get welcome_generate:post_url
    assert_response :success
  end

end
