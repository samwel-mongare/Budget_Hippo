require "test_helper"

class BeansControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get beans_index_url
    assert_response :success
  end
end
