require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get learnlog" do
    get main_learnlog_url
    assert_response :success
  end
end
