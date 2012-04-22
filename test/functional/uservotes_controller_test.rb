require 'test_helper'

class UservotesControllerTest < ActionController::TestCase
  setup do
    @uservote = uservotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uservotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uservote" do
    assert_difference('Uservote.count') do
      post :create, uservote: @uservote.attributes
    end

    assert_redirected_to uservote_path(assigns(:uservote))
  end

  test "should show uservote" do
    get :show, id: @uservote.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uservote.to_param
    assert_response :success
  end

  test "should update uservote" do
    put :update, id: @uservote.to_param, uservote: @uservote.attributes
    assert_redirected_to uservote_path(assigns(:uservote))
  end

  test "should destroy uservote" do
    assert_difference('Uservote.count', -1) do
      delete :destroy, id: @uservote.to_param
    end

    assert_redirected_to uservotes_path
  end
end
