require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get rootpage" do
    get home_rootpage_url
    assert_response :success
  end

end
