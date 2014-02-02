require 'test_helper'

class PlaceholdersControllerTest < ActionController::TestCase
  setup do
    @placeholder = placeholders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:placeholders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create placeholder" do
    assert_difference('Placeholder.count') do
      post :create, placeholder: { position: @placeholder.position }
    end

    assert_redirected_to placeholder_path(assigns(:placeholder))
  end

  test "should show placeholder" do
    get :show, id: @placeholder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @placeholder
    assert_response :success
  end

  test "should update placeholder" do
    patch :update, id: @placeholder, placeholder: { position: @placeholder.position }
    assert_redirected_to placeholder_path(assigns(:placeholder))
  end

  test "should destroy placeholder" do
    assert_difference('Placeholder.count', -1) do
      delete :destroy, id: @placeholder
    end

    assert_redirected_to placeholders_path
  end
end
