require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
   include AuthenticatedTestHelper
  fixtures :users

  test "should get index" do
     login_as :quentin
    get :index
    assert_response :success
    assert_not_nil assigns(:messages)
  end

  test "should get new" do
    get :new , :name => 'pageone'
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post :create, :message => {:name => 'bob', :subject => 'test', :body => 'test body', :email => 'bob@example.com' }
    end
    assert_redirected_to root_path
    
  end

  test "should show message" do
     login_as :quentin
    get :show, :id => messages(:one).id
    assert_response :success
  end

  test "should get edit" do
     login_as :quentin
    get :edit, :id => messages(:one).id
    assert_response :success
  end

  test "should update message" do
     login_as :quentin
    put :update, :id => messages(:one).id, :message => { }
    assert_redirected_to message_path(assigns(:message))
  end

  test "should destroy message" do
     login_as :quentin
    assert_difference('Message.count', -1) do
      delete :destroy, :id => messages(:one).id
    end

    assert_redirected_to messages_path
  end
end
