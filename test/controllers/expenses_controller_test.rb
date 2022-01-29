require "test_helper"

class ExpensesControllerTest < ActionDispatch::IntegrationTest
  test "should get amount:float" do
    get expenses_amount:float_url
    assert_response :success
  end

  test "should get category:references" do
    get expenses_category:references_url
    assert_response :success
  end
end
