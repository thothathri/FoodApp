require 'test_helper'

class CampusFoodsControllerTest < ActionController::TestCase
  setup do
    @campus_food = campus_foods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:campus_foods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create campus_food" do
    assert_difference('CampusFood.count') do
      post :create, campus_food: @campus_food.attributes
    end

    assert_redirected_to campus_food_path(assigns(:campus_food))
  end

  test "should show campus_food" do
    get :show, id: @campus_food.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @campus_food.to_param
    assert_response :success
  end

  test "should update campus_food" do
    put :update, id: @campus_food.to_param, campus_food: @campus_food.attributes
    assert_redirected_to campus_food_path(assigns(:campus_food))
  end

  test "should destroy campus_food" do
    assert_difference('CampusFood.count', -1) do
      delete :destroy, id: @campus_food.to_param
    end

    assert_redirected_to campus_foods_path
  end
end
