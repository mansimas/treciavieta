require 'test_helper'

class BanketsControllerTest < ActionController::TestCase
  setup do
    @banket = bankets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bankets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create banket" do
    assert_difference('Banket.count') do
      post :create, banket: { arrival: @banket.arrival, departure: @banket.departure, places: @banket.places, post_id: @banket.post_id, price: @banket.price }
    end

    assert_redirected_to banket_path(assigns(:banket))
  end

  test "should show banket" do
    get :show, id: @banket
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @banket
    assert_response :success
  end

  test "should update banket" do
    patch :update, id: @banket, banket: { arrival: @banket.arrival, departure: @banket.departure, places: @banket.places, post_id: @banket.post_id, price: @banket.price }
    assert_redirected_to banket_path(assigns(:banket))
  end

  test "should destroy banket" do
    assert_difference('Banket.count', -1) do
      delete :destroy, id: @banket
    end

    assert_redirected_to bankets_path
  end
end
