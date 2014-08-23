require 'test_helper'

class HeadingsControllerTest < ActionController::TestCase
  setup do
    @heading = headings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:headings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create heading" do
    assert_difference('Heading.count') do
      post :create, heading: { chapter_id: @heading.chapter_id, content: @heading.content, order: @heading.order }
    end

    assert_redirected_to heading_path(assigns(:heading))
  end

  test "should show heading" do
    get :show, id: @heading
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @heading
    assert_response :success
  end

  test "should update heading" do
    patch :update, id: @heading, heading: { chapter_id: @heading.chapter_id, content: @heading.content, order: @heading.order }
    assert_redirected_to heading_path(assigns(:heading))
  end

  test "should destroy heading" do
    assert_difference('Heading.count', -1) do
      delete :destroy, id: @heading
    end

    assert_redirected_to headings_path
  end
end
