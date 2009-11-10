require 'test_helper'

class PagesControllerTest < ActionController::TestCase
     include AuthenticatedTestHelper
  fixtures :users

  test "should get index" do
       login_as :quentin
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  test "should get new" do
       login_as :quentin
    get :new
    assert_response :success
  end

  test "should create page" do
       login_as :quentin
    assert_difference('Page.count') do
      post :create, :page => { }
    end

    assert_redirected_to page_path(assigns(:page))
  end

  test "should show page" do
       login_as :quentin
    get :show, :id => pages(:one).id
    assert_response :success
  end

  test "should get edit" do
       login_as :quentin
    get :edit, :id => pages(:one).id
    assert_response :success
  end

  test "should update page" do
       login_as :quentin
    put :update, :id => pages(:one).id, :page => { }
    assert_redirected_to page_path(assigns(:page))
  end

  test "should destroy page" do
       login_as :quentin
    assert_difference('Page.count', -1) do
      delete :destroy, :id => pages(:one).id
    end

    assert_redirected_to pages_path
  end
end
