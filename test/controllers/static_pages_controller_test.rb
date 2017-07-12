require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "SciStorm"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "Help | SciStorm"
  end

  test "should get about" do
    get abt_path
    assert_response :success
    assert_select "title", "About | SciStorm"
  end

  test "should get contact" do
    get c_path
    assert_response :success
    assert_select "title", "Contact | SciStorm"
  end
end
