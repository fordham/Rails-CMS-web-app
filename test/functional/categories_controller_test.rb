require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  include AuthenticatedTestHelper
  fixtures :users

  test "should get index" do
    login_as :quentin
    get :index
    assert_response :success
    assert_not_nil assigns(:categories)
  end

  test "should get new" do
     login_as :quentin
    get :new
    assert_response :success
  end

  test "should create category" do
     login_as :quentin
    assert_difference('Category.count') do
      post :create, :category => { :title =>'test'}
    end

    assert_redirected_to category_path(assigns(:category))
  end

  test "should show category" do
     login_as :quentin
    get :show, :id => categories(:ruby).id
    assert_response :success
  end

  test "should get edit" do
     login_as :quentin
    get :edit, :id => categories(:ruby).id
    assert_response :success
  end

  test "should update category" do
     login_as :quentin
    put :update, :id => categories(:ruby).id, :category => {:title =>'test' }
    assert_redirected_to category_path(assigns(:category))
  end

  test "should destroy category" do
     login_as :quentin
    assert_difference('Category.count', -1) do
      delete :destroy, :id => categories(:ruby).id
    end

    assert_redirected_to categories_path
  end
end
