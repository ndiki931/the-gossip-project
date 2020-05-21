require 'test_helper'

class ContactControllerTest < ActionDispatch::IntegrationTest
  test "should get team_contact" do
    get contact_team_contact_url
    assert_response :success
  end

end
