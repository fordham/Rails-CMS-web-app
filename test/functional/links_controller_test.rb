require 'test_helper'

class LinksControllerTest < ActionController::TestCase
     include AuthenticatedTestHelper
  fixtures :users, :pages

  test "should not get index not logged in" do
      get :index
      assert_redirected_to new_session_path
   end


  test "should get index" do
     login_as :quentin
    get :index
    assert_response :success
    assert_not_nil assigns(:links)
  end

  test "should get list" do
    get :list, :name => 'pageone'
    assert_response :success
    assert_not_nil assigns(:categories)
    assert_not_nil assigns(:pagetitle)
    assert_not_nil assigns(:page)
  end

  test "should get new" do
     login_as :quentin
    get :new
    assert_response :success
  end

  test "should create link" do
     login_as :quentin
    assert_difference('Link.count') do
      post :create, :link => { :title => 'a test link'}
    end

    assert_redirected_to link_path(assigns(:link))
  end

  test "should show link" do
      login_as :quentin
    get :show, :id => links(:learningrails).id
    assert_response :success
  end

  test "should get edit" do
     login_as :quentin
    get :edit, :id => links(:learningrails).id
    assert_response :success
  end

  test "should update link" do
     login_as :quentin
    put :update, :id => links(:learningrails).id, :link => { }
    assert_redirected_to link_path(assigns(:link))
  end

  test "should destroy link" do
     login_as :quentin
    assert_difference('Link.count', -1) do
      delete :destroy, :id => links(:learningrails).id
    end

    assert_redirected_to links_path
  end
end
