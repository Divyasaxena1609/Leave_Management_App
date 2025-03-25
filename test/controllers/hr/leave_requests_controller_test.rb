require "test_helper"

class Hr::LeaveRequestsControllerTest < ActionDispatch::IntegrationTest
  test "should get update" do
    get hr_leave_requests_update_url
    assert_response :success
  end
end
