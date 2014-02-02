require 'test_helper'

class AreaAttributesControllerTest < ActionController::TestCase
  setup do
    @area_attribute = area_attributes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:area_attributes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create area_attribute" do
    assert_difference('AreaAttribute.count') do
      post :create, area_attribute: { name: @area_attribute.name, value: @area_attribute.value }
    end

    assert_redirected_to area_attribute_path(assigns(:area_attribute))
  end

  test "should show area_attribute" do
    get :show, id: @area_attribute
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @area_attribute
    assert_response :success
  end

  test "should update area_attribute" do
    patch :update, id: @area_attribute, area_attribute: { name: @area_attribute.name, value: @area_attribute.value }
    assert_redirected_to area_attribute_path(assigns(:area_attribute))
  end

  test "should destroy area_attribute" do
    assert_difference('AreaAttribute.count', -1) do
      delete :destroy, id: @area_attribute
    end

    assert_redirected_to area_attributes_path
  end
end
